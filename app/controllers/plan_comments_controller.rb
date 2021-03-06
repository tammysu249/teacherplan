class PlanCommentsController < ApplicationController
  before_action :set_plan_comment, only: %i[show edit update destroy]

  def index
    @q = PlanComment.ransack(params[:q])
    @plan_comments = @q.result(distinct: true).includes(:improvement_plan).page(params[:page]).per(10)
  end

  def show; end

  def new
    @plan_comment = PlanComment.new
  end

  def edit; end

  def create
    @plan_comment = PlanComment.new(plan_comment_params)

    if @plan_comment.save
      message = "PlanComment was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @plan_comment, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @plan_comment.update(plan_comment_params)
      redirect_to @plan_comment,
                  notice: "Plan comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @plan_comment.destroy
    message = "PlanComment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to plan_comments_url, notice: message
    end
  end

  private

  def set_plan_comment
    @plan_comment = PlanComment.find(params[:id])
  end

  def plan_comment_params
    params.require(:plan_comment).permit(:improvement_plan_id, :coach_id,
                                         :content)
  end
end
