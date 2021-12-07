require "rails_helper"

RSpec.describe GoalResource, type: :resource do
  describe "serialization" do
    let!(:goal) { create(:goal) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(goal.id)
      expect(data.jsonapi_type).to eq("goals")
    end
  end

  describe "filtering" do
    let!(:goal1) { create(:goal) }
    let!(:goal2) { create(:goal) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: goal2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([goal2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:goal1) { create(:goal) }
      let!(:goal2) { create(:goal) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      goal1.id,
                                      goal2.id,
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
                                      goal2.id,
                                      goal1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
