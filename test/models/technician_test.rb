# == Schema Information
#
# Table name: technicians
#
#  id           :integer          not null, primary key
#  discarded_at :datetime
#  email        :text
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_technicians_on_discarded_at  (discarded_at)
#
require "test_helper"

class TechnicianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
