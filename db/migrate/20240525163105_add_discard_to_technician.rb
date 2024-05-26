class AddDiscardToTechnician < ActiveRecord::Migration[7.0]
  def change
    add_column :technicians, :discarded_at, :datetime
    add_index :technicians, :discarded_at
  end
end
