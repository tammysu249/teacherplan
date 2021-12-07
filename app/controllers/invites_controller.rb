class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  # GET /invites
  def index
    @q = Invite.ransack(params[:q])
    @invites = @q.result(:distinct => true).includes(:coach, :improvement_plan).page(params[:page]).per(10)
  end

  # GET /invites/1
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  def create
    @invite = Invite.new(invite_params)

    if @invite.save
      message = 'Invite was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @invite, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /invites/1
  def update
    if @invite.update(invite_params)
      redirect_to @invite, notice: 'Invite was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invites/1
  def destroy
    @invite.destroy
    message = "Invite was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to invites_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invite_params
      params.require(:invite).permit(:coach_id, :improvement_plan_id)
    end
end
