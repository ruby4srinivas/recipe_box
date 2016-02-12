class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :directions

  # include Tire::Model::Search #elastic Search
  # include Tire::Model::Callbacks #elastic search



  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes['name'].blank?},
                                allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes['step'].blank? },
                                allow_destroy: true
  validates :title, :description,:image,  presence: true
  #validates :image, :attachment_content_type => { :content_type => ['image/png', 'image/jpg']}
  has_attached_file :image, styles: { small: "64x64", medium: "100x100", large: "200x200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  before_save :strip_whitespaces
  before_validation { image.clear if @delete_image }

  #elastic search start
  # def as_indexed_json(options={})
  #   as_json(
  #       only: [:id, :name, :description],
  #       include: [:ingredients],
  #       include: [:directions]
  #   )
  # end
  #
  # def as_indexed_json
  #   self.as_json({
  #                    only: [:title, :description],
  #                    include: {
  #                        ingredients: { only: :name },
  #                        directions: { only: :step },
  #                    }
  #                })
  # end

  #elastic search end

  #solr search start
  searchable do
    text :description
    text :ingredients do
      ingredients.map( &:name )
    end
    text :directions do
      directions.map(&:step)
    end
    time :created_at
    string :publish_month
  end

  def publish_month
    created_at.strftime("%B %Y")
  end
  #solr search end
  def delete_image
    @delete_image ||= false
  end

  def delete_image=(value)
    @delete_image  = !value.to_i.zero?
  end
#elastic

  # def self.search(params)
  #   tire.search(load: true) do
  #     query {string params[:query]} if params[:query].present?
  #   end
  #
  # end
  protected

  def self.simple_search(query)
    query ? where('lower(title) like ?', "%#{query.downcase}%")
    : all.order('created_at desc').where.not(title: nil)
  end

  private

  def strip_whitespaces()
    self.title.squish!
    self.description.squish!
    self.ingredients.each{|n| n.name.squish!}
    self.directions.each{|n| n.step.squish!}
  end
end

