class Goal < ApplicationRecord
  # Direct associations

  has_many   :action_steps,
             :dependent => :destroy

  belongs_to :improvement_plan

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    improvement_plan.to_s
  end

end
