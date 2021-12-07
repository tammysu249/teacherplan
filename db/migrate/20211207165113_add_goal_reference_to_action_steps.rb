class AddGoalReferenceToActionSteps < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :action_steps, :goals
    add_index :action_steps, :goal_id
    change_column_null :action_steps, :goal_id, false
  end
end
