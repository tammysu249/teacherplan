class AddTeacherReferenceToImprovementPlans < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :improvement_plans, :teachers
    add_index :improvement_plans, :teacher_id
    change_column_null :improvement_plans, :teacher_id, false
  end
end
