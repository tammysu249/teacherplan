class InvitesController < ApplicationController
  before_action :set_invite, only: %i[show edit update destroy]

  def index
    @q = Invite.ransack(params[:q])
    @invites = @q.result(distinct: true).includes(:coach,
                                                  :improvement_plan).page(params[:page]).per(10)
  end

  def show; end

  def new
    @invite = Invite.new
  end

  def edit; end

  def create
    @invite = Invite.new(invite_params)

    if @invite.save
      message = "Invite was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @invite, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @invite.update(invite_params)
      redirect_to @invite, notice: "Invite was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @invite.destroy
    message = "Invite was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to invites_url, notice: message
    end
  end

  private

  def set_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:coach_id, :improvement_plan_id)
  end
end
