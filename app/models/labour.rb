# == Schema Information
#
# Table name: labours
#
#  id          :integer          not null, primary key
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#
# Indexes
#
#  index_labours_on_category_id  (category_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
class Labour < ApplicationRecord
  belongs_to :category

  validates_presence_of :title, :start_date, :end_date

  scope :root_labour, ->(category_id) {joins(:category).where(category_id: category_id).or(where(category: {parent_id: category_id}))}
end
