class Api::V1::GoalsController < Api::V1::GraphitiController
  def index
    goals = GoalResource.all(params)
    respond_with(goals)
  end

  def show
    goal = GoalResource.find(params)
    respond_with(goal)
  end

  def create
    goal = GoalResource.build(params)

    if goal.save
      render jsonapi: goal, status: 201
    else
      render jsonapi_errors: goal
    end
  end

  def update
    goal = GoalResource.find(params)

    if goal.update_attributes
      render jsonapi: goal
    else
      render jsonapi_errors: goal
    end
  end

  def destroy
    goal = GoalResource.find(params)

    if goal.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: goal
    end
  end
end
