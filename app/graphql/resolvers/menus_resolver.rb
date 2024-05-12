module Resolvers
  class MenusResolver < Resolvers::BaseResolver
    type [Types::MenuType], null: true

    def resolve
      Menu.all
    end
  end
end
