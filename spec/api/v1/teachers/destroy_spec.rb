require "rails_helper"

RSpec.describe "teachers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/teachers/#{teacher.id}"
  end

  describe "basic destroy" do
    let!(:teacher) { create(:teacher) }

    it "updates the resource" do
      expect(TeacherResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Teacher.count }.by(-1)
      expect { teacher.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
