class AddImprovementPlanReferenceToGoals < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :goals, :improvement_plans
    add_index :goals, :improvement_plan_id
    change_column_null :goals, :improvement_plan_id, false
  end
end
