class GoalResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :improvement_plan_id, :integer
  attribute :description, :string

  # Direct associations

  # Indirect associations

end
