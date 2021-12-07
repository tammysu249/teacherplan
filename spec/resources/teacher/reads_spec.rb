require 'rails_helper'

RSpec.describe TeacherResource, type: :resource do
  describe 'serialization' do
    let!(:teacher) { create(:teacher) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(teacher.id)
      expect(data.jsonapi_type).to eq('teachers')
    end
  end

  describe 'filtering' do
    let!(:teacher1) { create(:teacher) }
    let!(:teacher2) { create(:teacher) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: teacher2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([teacher2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:teacher1) { create(:teacher) }
      let!(:teacher2) { create(:teacher) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            teacher1.id,
            teacher2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            teacher2.id,
            teacher1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
