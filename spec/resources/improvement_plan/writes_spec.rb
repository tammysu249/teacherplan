require 'rails_helper'

RSpec.describe ImprovementPlanResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'improvement_plans',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ImprovementPlanResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ImprovementPlan.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:improvement_plan) { create(:improvement_plan) }

    let(:payload) do
      {
        data: {
          id: improvement_plan.id.to_s,
          type: 'improvement_plans',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ImprovementPlanResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { improvement_plan.reload.updated_at }
      # .and change { improvement_plan.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:improvement_plan) { create(:improvement_plan) }

    let(:instance) do
      ImprovementPlanResource.find(id: improvement_plan.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ImprovementPlan.count }.by(-1)
    end
  end
end
