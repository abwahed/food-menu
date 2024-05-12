module Resolvers
  class SectionsResolver < Resolvers::BaseResolver
    type [Types::SectionType], null: true

    argument :menu_id, ID, required: false

    def resolve(menu_id: nil)
      return Menu.find_by(id: menu_id).sections if menu_id.present?

      return object.sections if object.present?

      Section.all
    end
  end
end
