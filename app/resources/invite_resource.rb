class InviteResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :coach_id, :integer
  attribute :improvement_plan_id, :integer

  # Direct associations

  # Indirect associations

end
