require 'rails_helper'

RSpec.describe "teachers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/teachers", params: params
  end

  describe 'basic fetch' do
    let!(:teacher1) { create(:teacher) }
    let!(:teacher2) { create(:teacher) }

    it 'works' do
      expect(TeacherResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['teachers'])
      expect(d.map(&:id)).to match_array([teacher1.id, teacher2.id])
    end
  end
end
