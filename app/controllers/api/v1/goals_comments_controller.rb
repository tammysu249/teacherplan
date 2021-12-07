class Api::V1::GoalsCommentsController < Api::V1::GraphitiController
  def index
    goals_comments = GoalsCommentResource.all(params)
    respond_with(goals_comments)
  end

  def show
    goals_comment = GoalsCommentResource.find(params)
    respond_with(goals_comment)
  end

  def create
    goals_comment = GoalsCommentResource.build(params)

    if goals_comment.save
      render jsonapi: goals_comment, status: 201
    else
      render jsonapi_errors: goals_comment
    end
  end

  def update
    goals_comment = GoalsCommentResource.find(params)

    if goals_comment.update_attributes
      render jsonapi: goals_comment
    else
      render jsonapi_errors: goals_comment
    end
  end

  def destroy
    goals_comment = GoalsCommentResource.find(params)

    if goals_comment.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: goals_comment
    end
  end
end
