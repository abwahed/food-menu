module Resolvers
  class ModifierGroupsResolver < Resolvers::BaseResolver
    type [Types::ModifierGroupType], null: true

    argument :item_id, ID, required: false

    def resolve(item_id: nil)
      return Item.find_by(id: item_id).items if item_id.present?

      return object.modifier_groups if object.present?

      ModifierGroup.all
    end
  end
end
