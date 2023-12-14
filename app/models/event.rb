class Event < ApplicationRecord
  validates :name, :location, presence: true
  validates :description, length: { minimum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }

  scope :starts_at_order, -> { order("starts_at") }
  scope :upcoming, -> { starts_at_order.where("starts_at > ?", Time.now) }

  def free?
    price.blank? || price.zero?
  end
end
