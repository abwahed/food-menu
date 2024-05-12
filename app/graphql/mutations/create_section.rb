module Mutations
  class CreateSection < Mutations::BaseMutation
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :description, String, required: false
    argument :menu_id, ID, required: true

    field :section, Types::SectionType, null: true
    field :errors, [String], null: false

    def resolve(identifier:, label:, menu_id:, description: nil)
      section = Section.new(identifier:, label:, description:)

      if section.save
        MenuSection.create(menu_id:, section_id: section.id)
        { section:, errors: [] }
      else
        { section: nil, errors: section.errors.full_messages }
      end
    end
  end
end
