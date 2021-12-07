require "rails_helper"

RSpec.describe PlanComment, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:improvement_plan) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
