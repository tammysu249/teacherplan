require 'rails_helper'

RSpec.describe "invites#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/invites/#{invite.id}", payload
  end

  describe 'basic update' do
    let!(:invite) { create(:invite) }

    let(:payload) do
      {
        data: {
          id: invite.id.to_s,
          type: 'invites',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(InviteResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { invite.reload.attributes }
    end
  end
end
