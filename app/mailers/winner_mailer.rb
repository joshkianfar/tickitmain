class WinnerMailer < ApplicationMailer
    def notify(user, item)
        @user = user
        @item = item
        mail(to: @user.email, subject: 'Congratulations! You won an item on TickIt!')
      end      
end
