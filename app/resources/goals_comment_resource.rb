class GoalsCommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :goal_id, :integer
  attribute :coach_id, :integer
  attribute :content, :string

  # Direct associations

  # Indirect associations

end
