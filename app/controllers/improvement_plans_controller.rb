class ImprovementPlansController < ApplicationController
  before_action :set_improvement_plan, only: [:show, :edit, :update, :destroy]

  # GET /improvement_plans
  def index
    @improvement_plans = ImprovementPlan.all
  end

  # GET /improvement_plans/1
  def show
    @plan_comment = PlanComment.new
    @invite = Invite.new
    @goal = Goal.new
  end

  # GET /improvement_plans/new
  def new
    @improvement_plan = ImprovementPlan.new
  end

  # GET /improvement_plans/1/edit
  def edit
  end

  # POST /improvement_plans
  def create
    @improvement_plan = ImprovementPlan.new(improvement_plan_params)

    if @improvement_plan.save
      message = 'ImprovementPlan was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @improvement_plan, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /improvement_plans/1
  def update
    if @improvement_plan.update(improvement_plan_params)
      redirect_to @improvement_plan, notice: 'Improvement plan was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /improvement_plans/1
  def destroy
    @improvement_plan.destroy
    message = "ImprovementPlan was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to improvement_plans_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_improvement_plan
      @improvement_plan = ImprovementPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def improvement_plan_params
      params.require(:improvement_plan).permit(:teacher_id, :status)
    end
end
