require 'rails_helper'

RSpec.describe Goal, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:action_steps) }

    it { should belong_to(:improvement_plan) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
