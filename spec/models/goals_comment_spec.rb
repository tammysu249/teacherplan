require 'rails_helper'

RSpec.describe GoalsComment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:goal) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
