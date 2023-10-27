class Item < ApplicationRecord
  belongs_to :user
  has_rich_text :more_info
  has_many :tickets
  validates :description, presence: true
  has_one_attached :image

  validates :max_tickets, presence: true, numericality: { greater_than: 0 }
  before_validation :set_max_tickets, on: :create
  validates :sell_goal, presence: true, numericality: { greater_than: 0 }

private

def validate_max_tickets
  if self.item.tickets.count >= self.item.max_tickets
    errors.add(:item, "has sold out of tickets!")
    throw(:abort)
  end
end

def set_max_tickets
  if self.description.blank? && (self.sell_goal.blank? || self.sell_goal <= 0)
    errors.add(:description, "cannot be blank")
    errors.add(:sell_goal, "has to be greater than 0")
    throw :abort
  elsif self.description.blank?
    errors.add(:description, "cannot be blank")
    throw :abort
  elsif self.sell_goal.blank? || self.sell_goal <= 0
    errors.add(:sell_goal, "has to be greater than 0")
    throw :abort
  else
    self.max_tickets = self.sell_goal * 2
  end
end




end
