class SectionItem < ApplicationRecord
  belongs_to :section
  belongs_to :item

  validates :section_id, presence: true
  validates :item_id, presence: true
end
