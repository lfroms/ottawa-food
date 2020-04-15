# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :validate_apple_id, mutation: Mutations::ValidateAppleId
    description 'The set of mutations that can be performed.'

    field :create_or_retrieve_restaurant,
      mutation: Mutations::CreateOrRetrieveRestaurant,
      description: 'Retrieves a restaurant if it exists, otherwise, creates and returns it.'

    field :create_bucket_list_item,
      mutation: Mutations::CreateBucketListItem,
      description: "Adds a particular restaurant to the current user's bucket list."

    field :update_bucket_list_item,
      mutation: Mutations::UpdateBucketListItem,
      description: 'Updates a bucket list item for the current user.'

    field :delete_bucket_list_item,
      mutation: Mutations::DeleteBucketListItem,
      description: 'Deletes a bucket list item for the current user.'

    field :toggle_favorite_restaurant,
      mutation: Mutations::ToggleFavoriteRestaurant,
      description: "Toggles a restaurant into/out of the current user's favorites list."
  end
end
