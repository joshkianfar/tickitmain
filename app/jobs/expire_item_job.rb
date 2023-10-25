class ExpireItemJob < ApplicationJob
  queue_as :default

  def perform(item_id)
    @item = Item.find_by(id: item_id)
  end

  return if item_already_inactive?

  @item.status = "inactive"
  @item.save!

  UserMailer.with(item: @item).item_expired_notice.deliver_later

  end

  private

  def item_already_inactive?
    @item.status == "inactive"
  end

end
