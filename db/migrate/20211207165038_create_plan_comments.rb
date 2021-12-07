class CreatePlanComments < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_comments do |t|
      t.integer :improvement_plan_id
      t.integer :coach_id
      t.text :content

      t.timestamps
    end
  end
end
