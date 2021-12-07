require 'rails_helper'

RSpec.describe GoalResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'goals',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GoalResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Goal.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:goal) { create(:goal) }

    let(:payload) do
      {
        data: {
          id: goal.id.to_s,
          type: 'goals',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GoalResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { goal.reload.updated_at }
      # .and change { goal.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:goal) { create(:goal) }

    let(:instance) do
      GoalResource.find(id: goal.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Goal.count }.by(-1)
    end
  end
end
