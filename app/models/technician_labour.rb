# == Schema Information
#
# Table name: technician_labours
#
#  id            :integer          not null, primary key
#  duration      :integer
#  total         :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  labour_id     :integer          not null
#  technician_id :integer          not null
#
# Indexes
#
#  index_technician_labours_on_labour_id      (labour_id)
#  index_technician_labours_on_technician_id  (technician_id)
#
# Foreign Keys
#
#  labour_id      (labour_id => labours.id)
#  technician_id  (technician_id => technicians.id)
#
class TechnicianLabour < ApplicationRecord
  belongs_to :technician
  belongs_to :labour

  validates_presence_of :technician_id, :labour_id, :duration, :total
end