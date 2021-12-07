require 'rails_helper'

RSpec.describe "improvement_plans#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/improvement_plans/#{improvement_plan.id}"
  end

  describe 'basic destroy' do
    let!(:improvement_plan) { create(:improvement_plan) }

    it 'updates the resource' do
      expect(ImprovementPlanResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ImprovementPlan.count }.by(-1)
      expect { improvement_plan.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
