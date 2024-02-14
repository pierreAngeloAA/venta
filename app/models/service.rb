class Service < ApplicationRecord
  belongs_to :client
  belongs_to :technician

  has_many :service_labours 
  has_many :labours, through: :service_labours
end
