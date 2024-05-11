# == Schema Information
#
# Table name: service_labours
#
#  id          :integer          not null, primary key
#  description :string
#  duration    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  labour_id   :integer          not null
#  service_id  :integer          not null
#
# Indexes
#
#  index_service_labours_on_labour_id   (labour_id)
#  index_service_labours_on_service_id  (service_id)
#
# Foreign Keys
#
#  labour_id   (labour_id => labours.id)
#  service_id  (service_id => services.id)
#
class ServiceLabour < ApplicationRecord
  belongs_to :service
  belongs_to :labour

  validates_presence_of :service_id, :labour_id, :hours
  validates :hours, numericality: { greater_than: 0 }
end
