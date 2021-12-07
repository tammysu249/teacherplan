require "rails_helper"

RSpec.describe PlanCommentResource, type: :resource do
  describe "serialization" do
    let!(:plan_comment) { create(:plan_comment) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(plan_comment.id)
      expect(data.jsonapi_type).to eq("plan_comments")
    end
  end

  describe "filtering" do
    let!(:plan_comment1) { create(:plan_comment) }
    let!(:plan_comment2) { create(:plan_comment) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: plan_comment2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([plan_comment2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:plan_comment1) { create(:plan_comment) }
      let!(:plan_comment2) { create(:plan_comment) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      plan_comment1.id,
                                      plan_comment2.id,
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
                                      plan_comment2.id,
                                      plan_comment1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
