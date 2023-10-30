class WalletsController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @user = current_user
      @recent_transactions = @user.transactions.order(created_at: :desc).limit(5)
    end
  
    def deposit
      current_user.update(wallet_balance: current_user.wallet_balance + 10)
      current_user.transactions.create(transaction_type: "deposit", amount: 10, date_time: Time.current)
      redirect_to wallet_path, notice: "£10 has been added to your account."
    end
  
    def withdrawal
      if current_user.wallet_balance >= 10
        current_user.update(wallet_balance: current_user.wallet_balance - 10)
        current_user.transactions.create(transaction_type: "withdrawal", amount: 10, date_time: Time.current)
        redirect_to wallet_path, notice: "£10 has been withdrawn from your account."
      else
        redirect_to wallet_path, alert: "Insufficient funds."
      end
    end
  end
  