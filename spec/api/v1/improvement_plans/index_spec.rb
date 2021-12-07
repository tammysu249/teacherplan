require "rails_helper"

RSpec.describe "improvement_plans#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/improvement_plans", params: params
  end

  describe "basic fetch" do
    let!(:improvement_plan1) { create(:improvement_plan) }
    let!(:improvement_plan2) { create(:improvement_plan) }

    it "works" do
      expect(ImprovementPlanResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["improvement_plans"])
      expect(d.map(&:id)).to match_array([improvement_plan1.id,
                                          improvement_plan2.id])
    end
  end
end
