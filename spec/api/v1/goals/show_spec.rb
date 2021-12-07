require 'rails_helper'

RSpec.describe "goals#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/goals/#{goal.id}", params: params
  end

  describe 'basic fetch' do
    let!(:goal) { create(:goal) }

    it 'works' do
      expect(GoalResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('goals')
      expect(d.id).to eq(goal.id)
    end
  end
end
