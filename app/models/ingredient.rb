class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  validates_associated :recipe
  delegate :title,  :to => :recipe
end
