class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.references :client, null: false, foreign_key: true
      t.references :technician, null: false, foreign_key: true
      t.string :description
      t.date :initial_date
      t.date :end_date

      t.timestamps
    end
  end
end
