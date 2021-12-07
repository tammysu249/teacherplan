require 'rails_helper'

RSpec.describe "improvement_plans#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/improvement_plans/#{improvement_plan.id}", params: params
  end

  describe 'basic fetch' do
    let!(:improvement_plan) { create(:improvement_plan) }

    it 'works' do
      expect(ImprovementPlanResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('improvement_plans')
      expect(d.id).to eq(improvement_plan.id)
    end
  end
end
