class Teacher < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :invites,
             :foreign_key => "coach_id",
             :dependent => :destroy

  has_many   :improvement_plans,
             :dependent => :destroy

  # Indirect associations

  has_many   :improvement_plan_assignments,
             :through => :invites,
             :source => :improvement_plan

  # Validations

  # Scopes

  def to_s
    first_name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
