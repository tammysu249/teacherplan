class GoalResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :improvement_plan_id, :integer
  attribute :description, :string

  # Direct associations

  has_many   :goals_comments

  has_many   :action_steps

  belongs_to :improvement_plan

  # Indirect associations
end
