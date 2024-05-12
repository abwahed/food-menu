class Modifier < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group

  validates :item_id, presence: true
  validates :modifier_group_id, presence: true
  validates :display_order, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :default_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price_override, numericality: { float: true, greater_than: 0 }
end
