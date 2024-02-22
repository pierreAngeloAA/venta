class AddClientAndTechnicianToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :client_id, :integer
    add_column :users, :technician_id, :integer
  end
end
