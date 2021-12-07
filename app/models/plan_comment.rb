class PlanComment < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    improvement_plan.to_s
  end

end
