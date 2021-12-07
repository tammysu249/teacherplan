require 'rails_helper'

RSpec.describe GoalsCommentResource, type: :resource do
  describe 'serialization' do
    let!(:goals_comment) { create(:goals_comment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(goals_comment.id)
      expect(data.jsonapi_type).to eq('goals_comments')
    end
  end

  describe 'filtering' do
    let!(:goals_comment1) { create(:goals_comment) }
    let!(:goals_comment2) { create(:goals_comment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: goals_comment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([goals_comment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:goals_comment1) { create(:goals_comment) }
      let!(:goals_comment2) { create(:goals_comment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            goals_comment1.id,
            goals_comment2.id
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
            goals_comment2.id,
            goals_comment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
