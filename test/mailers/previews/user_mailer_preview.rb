# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def item_expired_notice
    return unless @item && @item.user
    UserMailer.with(item: Item.first).item_expired_notice
  end
end

