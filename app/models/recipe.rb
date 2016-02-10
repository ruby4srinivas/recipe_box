class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :directions



  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes['name'].blank?},
                                allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: proc { |attributes| attributes['step'].blank? },
                                allow_destroy: true
  validates :title, :description, :image, presence: true
  validates :image, :attachment_content_type => { :content_type => ['image/png', 'image/jpg']}
  has_attached_file :image, styles: { small: "64x64", medium: "100x100", large: "200x200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  before_save :strip_whitespaces

  protected

  def self.search(query)
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

