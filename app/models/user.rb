class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    client.nil? && technician.nil?
  end

  def client?
    client.present?
  end

  def technician?
    technician.present?
  end
end