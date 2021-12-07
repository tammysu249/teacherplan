require "rails_helper"

RSpec.describe "action_steps#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/action_steps/#{action_step.id}"
  end

  describe "basic destroy" do
    let!(:action_step) { create(:action_step) }

    it "updates the resource" do
      expect(ActionStepResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ActionStep.count }.by(-1)
      expect { action_step.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
