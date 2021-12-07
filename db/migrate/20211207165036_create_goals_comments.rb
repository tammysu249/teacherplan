class CreateGoalsComments < ActiveRecord::Migration[6.0]
  def change
    create_table :goals_comments do |t|
      t.integer :goal_id
      t.integer :coach_id
      t.text :content

      t.timestamps
    end
  end
end
