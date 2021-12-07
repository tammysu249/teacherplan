require 'rails_helper'

RSpec.describe PlanCommentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'plan_comments',
          attributes: { }
        }
      }
    end

    let(:instance) do
      PlanCommentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { PlanComment.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:plan_comment) { create(:plan_comment) }

    let(:payload) do
      {
        data: {
          id: plan_comment.id.to_s,
          type: 'plan_comments',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PlanCommentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { plan_comment.reload.updated_at }
      # .and change { plan_comment.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:plan_comment) { create(:plan_comment) }

    let(:instance) do
      PlanCommentResource.find(id: plan_comment.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { PlanComment.count }.by(-1)
    end
  end
end
