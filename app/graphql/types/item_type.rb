# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String
    field :price, Float
    field :item_type, Types::ItemTypeEnum
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :item_modifier_groups, [Types::ItemModifierGroupType], null: true
    field :modifier_groups, [Types::ModifierGroupType], null: true
    field :modifier, Types::ModifierType, null: true
  end
end
