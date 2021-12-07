require 'rails_helper'

RSpec.describe "teachers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/teachers/#{teacher.id}", payload
  end

  describe 'basic update' do
    let!(:teacher) { create(:teacher) }

    let(:payload) do
      {
        data: {
          id: teacher.id.to_s,
          type: 'teachers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(TeacherResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { teacher.reload.attributes }
    end
  end
end
