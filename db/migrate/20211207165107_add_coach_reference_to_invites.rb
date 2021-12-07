class AddCoachReferenceToInvites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :invites, :teachers, column: :coach_id
    add_index :invites, :coach_id
    change_column_null :invites, :coach_id, false
  end
end
