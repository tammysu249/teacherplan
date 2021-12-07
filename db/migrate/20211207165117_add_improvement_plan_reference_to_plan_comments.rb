class AddImprovementPlanReferenceToPlanComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :plan_comments, :improvement_plans
    add_index :plan_comments, :improvement_plan_id
    change_column_null :plan_comments, :improvement_plan_id, false
  end
end
