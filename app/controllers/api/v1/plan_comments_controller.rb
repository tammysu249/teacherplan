class Api::V1::PlanCommentsController < Api::V1::GraphitiController
  def index
    plan_comments = PlanCommentResource.all(params)
    respond_with(plan_comments)
  end

  def show
    plan_comment = PlanCommentResource.find(params)
    respond_with(plan_comment)
  end

  def create
    plan_comment = PlanCommentResource.build(params)

    if plan_comment.save
      render jsonapi: plan_comment, status: 201
    else
      render jsonapi_errors: plan_comment
    end
  end

  def update
    plan_comment = PlanCommentResource.find(params)

    if plan_comment.update_attributes
      render jsonapi: plan_comment
    else
      render jsonapi_errors: plan_comment
    end
  end

  def destroy
    plan_comment = PlanCommentResource.find(params)

    if plan_comment.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: plan_comment
    end
  end
end
