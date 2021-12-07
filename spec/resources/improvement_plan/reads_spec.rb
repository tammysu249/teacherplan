require 'rails_helper'

RSpec.describe ImprovementPlanResource, type: :resource do
  describe 'serialization' do
    let!(:improvement_plan) { create(:improvement_plan) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(improvement_plan.id)
      expect(data.jsonapi_type).to eq('improvement_plans')
    end
  end

  describe 'filtering' do
    let!(:improvement_plan1) { create(:improvement_plan) }
    let!(:improvement_plan2) { create(:improvement_plan) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: improvement_plan2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([improvement_plan2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:improvement_plan1) { create(:improvement_plan) }
      let!(:improvement_plan2) { create(:improvement_plan) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            improvement_plan1.id,
            improvement_plan2.id
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
            improvement_plan2.id,
            improvement_plan1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
