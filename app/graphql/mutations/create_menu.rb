module Mutations
  class CreateMenu < Mutations::BaseMutation
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :state, String, required: false
    argument :start_date, GraphQL::Types::ISO8601Date, required: false
    argument :end_date, GraphQL::Types::ISO8601Date, required: false

    field :menu, Types::MenuType, null: true
    field :errors, [String], null: false

    def resolve(identifier:, label:, state: nil, start_date: nil, end_date: nil)
      menu = Menu.new(identifier:, label:, state:, start_date:, end_date:)

      if menu.save
        { menu: menu, errors: [] }
      else
        { menu: nil, errors: menu.errors.full_messages }
      end
    end
  end
end
