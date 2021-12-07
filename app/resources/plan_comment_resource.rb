class PlanCommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :improvement_plan_id, :integer
  attribute :coach_id, :integer
  attribute :content, :string

  # Direct associations

  # Indirect associations

end
