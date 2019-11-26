class Recipe < ApplicationRecord
  has_one_attached :image
  validates :title, :description, :image, presence: true
  validate :correct_image_attachment

  private
  def correct_image_attachment
    if !image.attached?
      errors.add(:image, 'No image uploaded')
    elsif !image.image?
      image.purge #delete uploaded file
      errors.add(:image, 'File uploaded must be an image')
    end
  end
end
