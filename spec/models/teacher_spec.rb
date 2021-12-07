require "rails_helper"

RSpec.describe Teacher, type: :model do
  describe "Direct Associations" do
    it { should have_many(:invites) }

    it { should have_many(:improvement_plans) }
  end

  describe "InDirect Associations" do
    it { should have_many(:improvement_plan_assignments) }
  end

  describe "Validations" do
  end
end
