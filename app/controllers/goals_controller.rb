class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update destroy]

  def index
    @q = Goal.ransack(params[:q])
    @goals = @q.result(distinct: true).includes(:improvement_plan,
                                                :action_steps, :goals_comments).page(params[:page]).per(10)
  end

  def show
    @goals_comment = GoalsComment.new
    @action_step = ActionStep.new
  end

  def new
    @goal = Goal.new
  end

  def edit; end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      message = "Goal was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @goal, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to @goal, notice: "Goal was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    message = "Goal was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to goals_url, notice: message
    end
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:improvement_plan_id, :description)
  end
end
