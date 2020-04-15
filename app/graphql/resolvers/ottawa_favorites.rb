# frozen_string_literal: true
module Resolvers
  class OttawaFavorites < Resolvers::Base
    type Types::OttawaFavoriteType.connection_type, null: false

    def resolve
      OttawaFavorite.includes(:restaurant).all.order(:index)
    end
  end
end
