class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.integer :coach_id
      t.integer :improvement_plan_id

      t.timestamps
    end
  end
end
