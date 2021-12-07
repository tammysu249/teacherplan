require "rails_helper"

RSpec.describe "teachers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/teachers/#{teacher.id}", params: params
  end

  describe "basic fetch" do
    let!(:teacher) { create(:teacher) }

    it "works" do
      expect(TeacherResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("teachers")
      expect(d.id).to eq(teacher.id)
    end
  end
end
