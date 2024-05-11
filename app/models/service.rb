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
class Service < ApplicationRecord
  belongs_to :client
  belongs_to :technician

  has_many :service_labours, dependent: :destroy
  has_many :labours, through: :service_labours

  validates_presence_of :client_id, :technician_id, :description, :initial_date
  validate :end_date_after_initial_date

  private

  def end_date_after_initial_date
    return unless initial_date.present? && end_date.present?

    errors.add(:end_date, 'must be after the initial date') if end_date < initial_date
  end
end
