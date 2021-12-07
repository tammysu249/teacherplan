require "rails_helper"

RSpec.describe GoalsCommentResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "goals_comments",
          attributes: {},
        },
      }
    end

    let(:instance) do
      GoalsCommentResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { GoalsComment.count }.by(1)
    end
  end

  describe "updating" do
    let!(:goals_comment) { create(:goals_comment) }

    let(:payload) do
      {
        data: {
          id: goals_comment.id.to_s,
          type: "goals_comments",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      GoalsCommentResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { goals_comment.reload.updated_at }
      # .and change { goals_comment.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:goals_comment) { create(:goals_comment) }

    let(:instance) do
      GoalsCommentResource.find(id: goals_comment.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { GoalsComment.count }.by(-1)
    end
  end
end
