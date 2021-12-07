class ImprovementPlanResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :teacher_id, :integer
  attribute :status, :string

  # Direct associations

  has_many   :invites

  has_many   :goals

  belongs_to :teacher

  # Indirect associations

end
