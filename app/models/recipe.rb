class Recipe < ApplicationRecord
  has_many :ingredients, inverse_of: :recipe, :dependent => :delete_all
  has_many :directions, inverse_of: :recipe, :dependent => :delete_all

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  belongs_to :user
  has_one_attached :image
  validates :title, :description, :image, presence: true
  validate :correct_image_attachment

  acts_as_votable

  private
  def correct_image_attachment
    if !image.attached? #chech if file attached
      errors.add(:image, 'required')
    elsif !image.image?
      image.purge #delete uploaded file
      errors.add(:image, 'uploaded must be of image format')
    end
  end
end
