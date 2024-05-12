module Mutations
  class CreateItem < Mutations::BaseMutation
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :description, String, required: false
    argument :section_id, ID, required: true
    argument :price, Float, required: true
    argument :item_type, String, required: true

    field :item, Types::SectionType, null: true
    field :errors, [String], null: false

    def resolve(identifier:, label:, description: nil, section_id:, price:, item_type:)
      item = Item.new(identifier:, label:, description:, price:, item_type:)

      if item.save
        SectionItem.create(section_id:, item_id: item.id)
        { item:, errors: [] }
      else
        { item: nil, errors: item.errors.full_messages }
      end
    end
  end
end
