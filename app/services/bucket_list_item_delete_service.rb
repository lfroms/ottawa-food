# frozen_string_literal: true
class BucketListItemDeleteService < UseCaseService
  def execute(restaurant_id:, user_id:)
    item = BucketListItem.find_by(restaurant_id: restaurant_id, user_id: user_id)

    return nil if item.blank?

    item.destroy
  end
end
