class CreateTechnicianSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :technician_specialties do |t|
      t.references :technician, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
