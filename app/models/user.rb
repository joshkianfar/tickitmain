class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :tickets
  validates :wallet_balance, numericality: { greater_than_or_equal_to: 0 }
  has_many :transactions, dependent: :destroy


  def can_afford_ticket?
    self.wallet_balance >= 0.50
  end

  validates_presence_of :username, :first_name, :last_name, :house_name, :post_code
  

  
end
