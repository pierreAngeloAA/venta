class CreateTechnicians < ActiveRecord::Migration[7.0]
  def change
    create_table :technicians do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
