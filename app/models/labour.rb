class Labour < ApplicationRecord
  belongs_to :category

  validates_presence_of :description, :start_date, :end_date

  scope :root_labour, ->(category_id) {joins(:category).where(category_id: category_id).or(where(category: {parent_id: category_id}))}
end