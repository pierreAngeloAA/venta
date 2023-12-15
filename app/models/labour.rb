class Labour < ApplicationRecord
  belongs_to :category

  scope :root_labour, ->(category_id) {where(category_id: category_id)}
end