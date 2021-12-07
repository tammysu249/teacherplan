require "rails_helper"

RSpec.describe "goals#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/goals/#{goal.id}", payload
  end

  describe "basic update" do
    let!(:goal) { create(:goal) }

    let(:payload) do
      {
        data: {
          id: goal.id.to_s,
          type: "goals",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(GoalResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { goal.reload.attributes }
    end
  end
end
