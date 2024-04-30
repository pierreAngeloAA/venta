class Service < ApplicationRecord
  belongs_to :client
  belongs_to :technician

  has_many :service_labours, dependent: :destroy
  has_many :labours, through: :service_labours

  validates_presence_of :client_id, :technician_id, :description, :initial_date, :end_date
  validate :end_date_after_initial_date

  private

  def end_date_after_initial_date
    return unless initial_date.present? && end_date.present?
    
    errors.add(:end_date, 'must be after the initial date') if end_date < initial_date
  end
end
