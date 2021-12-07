require "rails_helper"

RSpec.describe "improvement_plans#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/improvement_plans/#{improvement_plan.id}", payload
  end

  describe "basic update" do
    let!(:improvement_plan) { create(:improvement_plan) }

    let(:payload) do
      {
        data: {
          id: improvement_plan.id.to_s,
          type: "improvement_plans",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ImprovementPlanResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { improvement_plan.reload.attributes }
    end
  end
end
