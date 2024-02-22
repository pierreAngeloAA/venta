class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    client_id.nil? && technician_id.nil?
  end

  def client?
    client_id.present?
  end

  def technician?
    technician_id.present?
  end
end