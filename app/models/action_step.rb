class ActionStep < ApplicationRecord
  # Direct associations

  belongs_to :goal

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    goal.to_s
  end
end
