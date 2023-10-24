class Item < ApplicationRecord
  belongs_to :user
  has_rich_text :more_info
end
