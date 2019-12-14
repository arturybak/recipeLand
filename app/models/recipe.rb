class Recipe < ApplicationRecord
  #Recipe has many ingredients and directions that will be destroyed when the recipe is destroyed
  has_many :ingredients, inverse_of: :recipe, :dependent => :delete_all
  has_many :directions, inverse_of: :recipe, :dependent => :delete_all

  #Recipe has to have at least one ingredient and one direction
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  belongs_to :user
  has_one_attached :image

  #Check if all the fields are present
  validates :title, :description, :image, presence: true
  validate :correct_image_attachment

  #Enables recipes to be voted upon, using actsasvotable gem
  acts_as_votable

  private
  #Method to validate if recipe has an image attached
  def correct_image_attachment
    #check if file attached
    if !image.attached?
      errors.add(:image, 'required')
    #check if file is an image
    elsif !image.image?
      #delete uploaded file
      image.purge
      errors.add(:image, 'uploaded must be of image format')
    end
  end
end
