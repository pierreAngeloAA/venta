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
require "test_helper"

class LabourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
