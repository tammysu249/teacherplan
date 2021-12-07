require 'rails_helper'

RSpec.describe "invites#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/invites/#{invite.id}", params: params
  end

  describe 'basic fetch' do
    let!(:invite) { create(:invite) }

    it 'works' do
      expect(InviteResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('invites')
      expect(d.id).to eq(invite.id)
    end
  end
end
