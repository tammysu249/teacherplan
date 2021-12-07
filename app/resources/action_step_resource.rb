class ActionStepResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :goal_id, :integer
  attribute :description, :string
  attribute :target_date, :date
  attribute :lead_person, :string
  attribute :resources_needed, :string
  attribute :implementation_specifics, :string
  attribute :measures_of_success, :string

  # Direct associations

  # Indirect associations

end
