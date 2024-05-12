module Resolvers
  class ItemResolver < Resolvers::BaseResolver
    type Types::ItemType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      Item.find_by(id:)
    end
  end
end
