module Resolvers
  class MenuResolver < Resolvers::BaseResolver
    type Types::MenuType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      Menu.find_by(id:)
    end
  end
end
