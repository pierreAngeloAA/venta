class AddUniqueIndexToTechnicianSkill < ActiveRecord::Migration[7.0]
  def change
    add_index :technician_skills, [:technician_id, :skill_id], unique: true
  end
end
