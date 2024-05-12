module Resolvers
  class ItemsResolver < Resolvers::BaseResolver
    type [Types::ItemType], null: true

    argument :menu_id, ID, required: false

    def resolve(menu_id: nil)
      return Menu.find_by(id: menu_id).items if menu_id.present?

      return object.items if object.present?

      Item.all
    end
  end
end
