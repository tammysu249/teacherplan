require "rails_helper"

RSpec.describe ActionStepResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "action_steps",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ActionStepResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ActionStep.count }.by(1)
    end
  end

  describe "updating" do
    let!(:action_step) { create(:action_step) }

    let(:payload) do
      {
        data: {
          id: action_step.id.to_s,
          type: "action_steps",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ActionStepResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { action_step.reload.updated_at }
      # .and change { action_step.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:action_step) { create(:action_step) }

    let(:instance) do
      ActionStepResource.find(id: action_step.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ActionStep.count }.by(-1)
    end
  end
end
