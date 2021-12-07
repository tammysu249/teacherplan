class ImprovementPlan < ApplicationRecord
  # Direct associations

  belongs_to :teacher

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    teacher.to_s
  end

end
