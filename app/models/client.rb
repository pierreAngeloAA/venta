class Client < ApplicationRecord
    belongs_to :user, optional: true

    validates :name, :email, presence: true
    validates :user_id, uniqueness: true, if: -> { user_id.present? }

end
