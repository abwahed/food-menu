module Resolvers
  class ModifiersResolver < Resolvers::BaseResolver
    type [Types::ModifierType], null: true

    argument :modifier_group_id, ID, required: false

    def resolve(modifier_group_id: nil)
      return ModifierGroup.find_by(id: modifier_group_id).modifiers if modifier_group_id.present?

      return object.modifiers if object.present?

      Modifier.all
    end
  end
end
