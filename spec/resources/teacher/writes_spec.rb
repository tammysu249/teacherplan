require "rails_helper"

RSpec.describe TeacherResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "teachers",
          attributes: {},
        },
      }
    end

    let(:instance) do
      TeacherResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Teacher.count }.by(1)
    end
  end

  describe "updating" do
    let!(:teacher) { create(:teacher) }

    let(:payload) do
      {
        data: {
          id: teacher.id.to_s,
          type: "teachers",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      TeacherResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { teacher.reload.updated_at }
      # .and change { teacher.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:teacher) { create(:teacher) }

    let(:instance) do
      TeacherResource.find(id: teacher.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Teacher.count }.by(-1)
    end
  end
end
