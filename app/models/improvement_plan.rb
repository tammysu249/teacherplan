class ImprovementPlan < ApplicationRecord
  # Direct associations

  has_many   :invites,
             :dependent => :destroy

  has_many   :goals,
             :dependent => :destroy

  belongs_to :teacher

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    teacher.to_s
  end

end
