require 'rails_helper'

RSpec.describe "improvement_plans#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/improvement_plans", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'improvement_plans',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ImprovementPlanResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ImprovementPlan.count }.by(1)
    end
  end
end
