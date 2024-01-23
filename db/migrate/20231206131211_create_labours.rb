class CreateLabours < ActiveRecord::Migration[7.0]
  def change
    create_table :labours do |t|
      t.references :category, null: false, foreign_key: true
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
