class ServiceLabour < ApplicationRecord
  belongs_to :service
  belongs_to :labour

  validates_presence_of :service_id, :labour_id, :hours
  validates :hours, numericality: { greater_than: 0 }
end
