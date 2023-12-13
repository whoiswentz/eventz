class Event < ApplicationRecord

  scope :starts_at_order, -> { order("starts_at") }
  scope :upcoming, -> { starts_at_order.where("starts_at > ?", Time.now) }

  def free?
    price.blank? || price.zero?
  end
end
