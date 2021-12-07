class AddGoalReferenceToGoalsComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :goals_comments, :goals
    add_index :goals_comments, :goal_id
    change_column_null :goals_comments, :goal_id, false
  end
end
