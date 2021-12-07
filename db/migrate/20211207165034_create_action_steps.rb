class CreateActionSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :action_steps do |t|
      t.integer :goal_id
      t.string :description
      t.date :target_date
      t.text :lead_person
      t.text :resources_needed
      t.text :implementation_specifics
      t.text :measures_of_success

      t.timestamps
    end
  end
end
