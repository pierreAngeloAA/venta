class CreateServiceLabours < ActiveRecord::Migration[7.0]
  def change
    create_table :service_labours do |t|
      t.references :service, null: false, foreign_key: true
      t.references :labour, null: false, foreign_key: true
      t.integer :hours

      t.timestamps
    end
  end
end
