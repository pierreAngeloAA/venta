# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  email      :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Client < ApplicationRecord
    belongs_to :user, optional: true

    validates :name, :email, presence: true
    validates :user_id, uniqueness: true, if: -> { user_id.present? }

end
