class Transaction < ApplicationRecord
    belongs_to :user
  
    enum transaction_type: { deposit: 0, withdrawal: 1 }
  
    validates :transaction_type, presence: true
    validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :date_time, presence: true
  end
  