class ImprovementPlansController < ApplicationController
  before_action :current_teacher_must_be_improvement_plan_teacher,
                only: %i[edit update destroy]

  before_action :set_improvement_plan, only: %i[show edit update destroy]

  def index
    @q = ImprovementPlan.ransack(params[:q])
    @improvement_plans = @q.result(distinct: true).includes(:teacher,
                                                            :goals, :invites, :plan_comments, :coaches).page(params[:page]).per(10)
  end

  def show
    @plan_comment = PlanComment.new
    @invite = Invite.new
    @goal = Goal.new
  end

  def new
    @improvement_plan = ImprovementPlan.new
  end

  def edit; end

  def create
    @improvement_plan = ImprovementPlan.new(improvement_plan_params)

    if @improvement_plan.save
      message = "ImprovementPlan was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @improvement_plan, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @improvement_plan.update(improvement_plan_params)
      redirect_to @improvement_plan,
                  notice: "Improvement plan was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @improvement_plan.destroy
    message = "ImprovementPlan was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to improvement_plans_url, notice: message
    end
  end

  private

  def current_teacher_must_be_improvement_plan_teacher
    set_improvement_plan
    unless current_teacher == @improvement_plan.teacher
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_improvement_plan
    @improvement_plan = ImprovementPlan.find(params[:id])
  end

  def improvement_plan_params
    params.require(:improvement_plan).permit(:teacher_id, :status)
  end
end
