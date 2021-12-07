class GoalsCommentsController < ApplicationController
  before_action :set_goals_comment, only: [:show, :edit, :update, :destroy]

  # GET /goals_comments
  def index
    @goals_comments = GoalsComment.all
  end

  # GET /goals_comments/1
  def show
  end

  # GET /goals_comments/new
  def new
    @goals_comment = GoalsComment.new
  end

  # GET /goals_comments/1/edit
  def edit
  end

  # POST /goals_comments
  def create
    @goals_comment = GoalsComment.new(goals_comment_params)

    if @goals_comment.save
      redirect_to @goals_comment, notice: 'Goals comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /goals_comments/1
  def update
    if @goals_comment.update(goals_comment_params)
      redirect_to @goals_comment, notice: 'Goals comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /goals_comments/1
  def destroy
    @goals_comment.destroy
    message = "GoalsComment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to goals_comments_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goals_comment
      @goals_comment = GoalsComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def goals_comment_params
      params.require(:goals_comment).permit(:goal_id, :coach_id, :content)
    end
end
