class CreateImprovementPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :improvement_plans do |t|
      t.integer :teacher_id
      t.string :status

      t.timestamps
    end
  end
end
