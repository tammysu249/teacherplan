class ActionStepsController < ApplicationController
  before_action :set_action_step, only: [:show, :edit, :update, :destroy]

  # GET /action_steps
  def index
    @action_steps = ActionStep.page(params[:page]).per(10)
  end

  # GET /action_steps/1
  def show
  end

  # GET /action_steps/new
  def new
    @action_step = ActionStep.new
  end

  # GET /action_steps/1/edit
  def edit
  end

  # POST /action_steps
  def create
    @action_step = ActionStep.new(action_step_params)

    if @action_step.save
      message = 'ActionStep was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @action_step, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /action_steps/1
  def update
    if @action_step.update(action_step_params)
      redirect_to @action_step, notice: 'Action step was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /action_steps/1
  def destroy
    @action_step.destroy
    message = "ActionStep was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to action_steps_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_step
      @action_step = ActionStep.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def action_step_params
      params.require(:action_step).permit(:goal_id, :description, :target_date, :lead_person, :resources_needed, :implementation_specifics, :measures_of_success)
    end
end
