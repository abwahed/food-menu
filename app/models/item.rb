class Item < ApplicationRecord
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups

  has_one :section_item
  has_one :section, through: :section_item
  has_one :modifier

  enum item_type: { product: 0, component: 1 }

  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true, uniqueness: true
  validates :item_type, inclusion: { in: Item.item_types.keys }
  validates :price, numericality: { float: true, greater_than: 0 }
end
