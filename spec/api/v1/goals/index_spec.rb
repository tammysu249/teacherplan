require "rails_helper"

RSpec.describe "goals#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/goals", params: params
  end

  describe "basic fetch" do
    let!(:goal1) { create(:goal) }
    let!(:goal2) { create(:goal) }

    it "works" do
      expect(GoalResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["goals"])
      expect(d.map(&:id)).to match_array([goal1.id, goal2.id])
    end
  end
end
