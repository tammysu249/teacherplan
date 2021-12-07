class ImprovementPlan < ApplicationRecord
  # Direct associations

  has_many   :plan_comments,
             :dependent => :destroy

  has_many   :invites,
             :dependent => :destroy

  has_many   :goals,
             :dependent => :destroy

  belongs_to :teacher

  # Indirect associations

  has_many   :coaches,
             :through => :invites,
             :source => :coach

  # Validations

  # Scopes

  def to_s
    teacher.to_s
  end

end
