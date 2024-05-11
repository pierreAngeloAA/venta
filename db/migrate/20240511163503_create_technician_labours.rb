class CreateTechnicianLabours < ActiveRecord::Migration[7.0]
  def change
    create_table :technician_labours do |t|
      t.references :technician, null: false, foreign_key: true
      t.references :labour, null: false, foreign_key: true
      t.integer :duration
      t.decimal :total

      t.timestamps
    end
  end
end
