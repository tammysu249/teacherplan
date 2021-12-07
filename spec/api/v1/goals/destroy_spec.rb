require "rails_helper"

RSpec.describe "goals#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/goals/#{goal.id}"
  end

  describe "basic destroy" do
    let!(:goal) { create(:goal) }

    it "updates the resource" do
      expect(GoalResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Goal.count }.by(-1)
      expect { goal.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
