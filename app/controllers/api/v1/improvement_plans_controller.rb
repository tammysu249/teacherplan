class Api::V1::ImprovementPlansController < Api::V1::GraphitiController
  def index
    improvement_plans = ImprovementPlanResource.all(params)
    respond_with(improvement_plans)
  end

  def show
    improvement_plan = ImprovementPlanResource.find(params)
    respond_with(improvement_plan)
  end

  def create
    improvement_plan = ImprovementPlanResource.build(params)

    if improvement_plan.save
      render jsonapi: improvement_plan, status: :created
    else
      render jsonapi_errors: improvement_plan
    end
  end

  def update
    improvement_plan = ImprovementPlanResource.find(params)

    if improvement_plan.update_attributes
      render jsonapi: improvement_plan
    else
      render jsonapi_errors: improvement_plan
    end
  end

  def destroy
    improvement_plan = ImprovementPlanResource.find(params)

    if improvement_plan.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: improvement_plan
    end
  end
end
