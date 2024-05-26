# == Schema Information
#
# Table name: services
#
#  id            :integer          not null, primary key
#  description   :string
#  end_date      :datetime
#  initial_date  :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  client_id     :integer          not null
#  technician_id :integer          not null
#
# Indexes
#
#  index_services_on_client_id      (client_id)
#  index_services_on_technician_id  (technician_id)
#
# Foreign Keys
#
#  client_id      (client_id => clients.id)
#  technician_id  (technician_id => technicians.id)
#
require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
