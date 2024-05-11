# == Schema Information
#
# Table name: technicians
#
#  id         :integer          not null, primary key
#  email      :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
require "test_helper"

class TechnicianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
