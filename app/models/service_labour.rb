class ServiceLabour < ApplicationRecord
  belongs_to :service
  belongs_to :labour

  validates :hours, numericality: { greater_than: 0 }
end
