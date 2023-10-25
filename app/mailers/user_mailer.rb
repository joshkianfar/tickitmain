class UserMailer < ApplicationMailer
  def item_expired_notice
    @item = params[:item]

    return unless @item && @item.user

    mail to: @item.user.email, subject: "Your item has expired!"
  end
end
