class WalletsController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @user = current_user
      @recent_transactions = @user.transactions.order(created_at: :desc).limit(5)
    end
  
    def deposit
      @user = current_user
      @recent_transactions = @user.transactions.order(created_at: :desc).limit(5)
      current_user.update(wallet_balance: current_user.wallet_balance + 10)
      current_user.transactions.create(transaction_type: "deposit", amount: 10, date_time: Time.current)
      @message = "£10 has been added to your account."
      
      respond_to do |format|
        format.html { render :show, status: :unprocessable_entity }
        format.turbo_stream { render :wallet_form_update, status: :unprocessable_entity }
      end
    end
  
    def withdrawal
      @user = current_user
      @recent_transactions = @user.transactions.order(created_at: :desc).limit(5)
      if current_user.wallet_balance >= 10
        current_user.update(wallet_balance: current_user.wallet_balance - 10)
        current_user.transactions.create(transaction_type: "withdrawal", amount: 10, date_time: Time.current)
        @message = "£10 has been deducted from your account."
      else
        redirect_to wallet_path, alert: "Insufficient funds."
        return
      end

      respond_to do |format|
        format.html { render :show, status: :unprocessable_entity }
        format.turbo_stream { render :wallet_form_update, status: :unprocessable_entity }
      end
    end
  end
  