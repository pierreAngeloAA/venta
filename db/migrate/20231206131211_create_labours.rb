class CreateLabours < ActiveRecord::Migration[7.0]
  def change
    create_table :labours do |t|
      t.references :skill, null: false, foreign_key: true
      t.text :title

      t.timestamps
    end
  end
end
