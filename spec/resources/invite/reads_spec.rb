require "rails_helper"

RSpec.describe InviteResource, type: :resource do
  describe "serialization" do
    let!(:invite) { create(:invite) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(invite.id)
      expect(data.jsonapi_type).to eq("invites")
    end
  end

  describe "filtering" do
    let!(:invite1) { create(:invite) }
    let!(:invite2) { create(:invite) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: invite2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([invite2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:invite1) { create(:invite) }
      let!(:invite2) { create(:invite) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      invite1.id,
                                      invite2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      invite2.id,
                                      invite1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
