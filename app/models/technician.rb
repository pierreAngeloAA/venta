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
class Technician < ApplicationRecord
    include Discard::Model

    belongs_to :user, optional: true
    has_many :technician_skills, dependent: :destroy
    has_many :skills, through: :technician_skills

    has_many :technician_labours, dependent: :destroy
    has_many :labours, through: :technician_labours

    validates :name,:email, presence: true
    validates :user_id, uniqueness: true, allow_nil: true

end
