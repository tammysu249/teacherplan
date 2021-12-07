class ActionStepsController < ApplicationController
  before_action :set_action_step, only: %i[show edit update destroy]

  def index
    @q = ActionStep.ransack(params[:q])
    @action_steps = @q.result(distinct: true).includes(:goal).page(params[:page]).per(10)
  end

  def show; end

  def new
    @action_step = ActionStep.new
  end

  def edit; end

  def create
    @action_step = ActionStep.new(action_step_params)

    if @action_step.save
      message = "ActionStep was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @action_step, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @action_step.update(action_step_params)
      redirect_to @action_step, notice: "Action step was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @action_step.destroy
    message = "ActionStep was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to action_steps_url, notice: message
    end
  end

  private

  def set_action_step
    @action_step = ActionStep.find(params[:id])
  end

  def action_step_params
    params.require(:action_step).permit(:goal_id, :description, :target_date,
                                        :lead_person, :resources_needed, :implementation_specifics, :measures_of_success)
  end
end
