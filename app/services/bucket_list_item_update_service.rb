# frozen_string_literal: true
class BucketListItemUpdateService < UseCaseService
  def execute(restaurant_id:, user_id:, status:)
    item = BucketListItem.find_by(restaurant_id: restaurant_id, user_id: user_id)

    return nil if item.blank?

    item.update(status: status)
    item
  end
end
