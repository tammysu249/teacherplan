require 'rails_helper'

RSpec.describe InviteResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'invites',
          attributes: { }
        }
      }
    end

    let(:instance) do
      InviteResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Invite.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:invite) { create(:invite) }

    let(:payload) do
      {
        data: {
          id: invite.id.to_s,
          type: 'invites',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      InviteResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { invite.reload.updated_at }
      # .and change { invite.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:invite) { create(:invite) }

    let(:instance) do
      InviteResource.find(id: invite.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Invite.count }.by(-1)
    end
  end
end
