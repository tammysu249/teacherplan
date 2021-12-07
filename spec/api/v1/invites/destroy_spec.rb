require "rails_helper"

RSpec.describe "invites#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/invites/#{invite.id}"
  end

  describe "basic destroy" do
    let!(:invite) { create(:invite) }

    it "updates the resource" do
      expect(InviteResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Invite.count }.by(-1)
      expect { invite.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
