require 'rails_helper'

RSpec.describe ImprovementPlan, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:teacher) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
