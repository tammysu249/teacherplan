require "rails_helper"

RSpec.describe "action_steps#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/action_steps", params: params
  end

  describe "basic fetch" do
    let!(:action_step1) { create(:action_step) }
    let!(:action_step2) { create(:action_step) }

    it "works" do
      expect(ActionStepResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["action_steps"])
      expect(d.map(&:id)).to match_array([action_step1.id, action_step2.id])
    end
  end
end
