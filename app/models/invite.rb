class Invite < ApplicationRecord
  # Direct associations

  belongs_to :improvement_plan

  belongs_to :coach,
             class_name: "Teacher"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    coach.to_s
  end
end
