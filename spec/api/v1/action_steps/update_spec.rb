require 'rails_helper'

RSpec.describe "action_steps#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/action_steps/#{action_step.id}", payload
  end

  describe 'basic update' do
    let!(:action_step) { create(:action_step) }

    let(:payload) do
      {
        data: {
          id: action_step.id.to_s,
          type: 'action_steps',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ActionStepResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { action_step.reload.attributes }
    end
  end
end
