require 'rails_helper'

RSpec.describe ImprovementPlan, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:plan_comments) }

    it { should have_many(:invites) }

    it { should have_many(:goals) }

    it { should belong_to(:teacher) }

    end

    describe "InDirect Associations" do

    it { should have_many(:coaches) }

    end

    describe "Validations" do

    end
end
