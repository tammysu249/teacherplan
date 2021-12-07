class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update destroy]

  # GET /goals
  def index
    @q = Goal.ransack(params[:q])
    @goals = @q.result(distinct: true).includes(:improvement_plan,
                                                :action_steps, :goals_comments).page(params[:page]).per(10)
  end

  # GET /goals/1
  def show
    @goals_comment = GoalsComment.new
    @action_step = ActionStep.new
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit; end

  # POST /goals
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

  # PATCH/PUT /goals/1
  def update
    if @goal.update(goal_params)
      redirect_to @goal, notice: "Goal was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /goals/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_goal
    @goal = Goal.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def goal_params
    params.require(:goal).permit(:improvement_plan_id, :description)
  end
end
