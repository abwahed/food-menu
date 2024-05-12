class Section < ApplicationRecord
  has_many :section_items
  has_many :items, through: :section_items

  has_one :menu_section
  has_one :menu, through: :menu_section
end
