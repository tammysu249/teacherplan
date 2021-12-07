class Api::V1::ActionStepsController < Api::V1::GraphitiController
  def index
    action_steps = ActionStepResource.all(params)
    respond_with(action_steps)
  end

  def show
    action_step = ActionStepResource.find(params)
    respond_with(action_step)
  end

  def create
    action_step = ActionStepResource.build(params)

    if action_step.save
      render jsonapi: action_step, status: :created
    else
      render jsonapi_errors: action_step
    end
  end

  def update
    action_step = ActionStepResource.find(params)

    if action_step.update_attributes
      render jsonapi: action_step
    else
      render jsonapi_errors: action_step
    end
  end

  def destroy
    action_step = ActionStepResource.find(params)

    if action_step.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: action_step
    end
  end
end
