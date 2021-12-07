class TeacherResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :school, :string

  # Direct associations

  has_many   :invites,
             foreign_key: :coach_id

  has_many   :improvement_plans

  # Indirect associations

end
