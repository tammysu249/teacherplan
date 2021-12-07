require "rails_helper"

RSpec.describe Invite, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:improvement_plan) }

    it { should belong_to(:coach) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
