class PlanComment < ApplicationRecord
  # Direct associations

  belongs_to :improvement_plan

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    improvement_plan.to_s
  end

end
