class AddLevelToTechnicianSkills < ActiveRecord::Migration[7.0]
  def change
    add_column :technician_skills, :level, :integer
  end
end
