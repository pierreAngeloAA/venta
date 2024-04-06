class AddEmailToClientAndTechnicians < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :email, :text
    add_column :technicians, :email, :text
  end
end
