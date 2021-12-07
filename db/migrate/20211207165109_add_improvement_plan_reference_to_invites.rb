class AddImprovementPlanReferenceToInvites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :invites, :improvement_plans
    add_index :invites, :improvement_plan_id
    change_column_null :invites, :improvement_plan_id, false
  end
end
