require 'rails_helper'

RSpec.describe "action_steps#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/action_steps/#{action_step.id}", params: params
  end

  describe 'basic fetch' do
    let!(:action_step) { create(:action_step) }

    it 'works' do
      expect(ActionStepResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('action_steps')
      expect(d.id).to eq(action_step.id)
    end
  end
end
