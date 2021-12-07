require "rails_helper"

RSpec.describe "invites#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/invites", params: params
  end

  describe "basic fetch" do
    let!(:invite1) { create(:invite) }
    let!(:invite2) { create(:invite) }

    it "works" do
      expect(InviteResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["invites"])
      expect(d.map(&:id)).to match_array([invite1.id, invite2.id])
    end
  end
end
