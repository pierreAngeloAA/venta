# == Schema Information
#
# Table name: labours
#
#  id         :integer          not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  skill_id   :integer          not null
#
# Indexes
#
#  index_labours_on_skill_id  (skill_id)
#
# Foreign Keys
#
#  skill_id  (skill_id => skills.id)
#
require "test_helper"

class LabourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
