class Api::V1::InvitesController < Api::V1::GraphitiController
  def index
    invites = InviteResource.all(params)
    respond_with(invites)
  end

  def show
    invite = InviteResource.find(params)
    respond_with(invite)
  end

  def create
    invite = InviteResource.build(params)

    if invite.save
      render jsonapi: invite, status: :created
    else
      render jsonapi_errors: invite
    end
  end

  def update
    invite = InviteResource.find(params)

    if invite.update_attributes
      render jsonapi: invite
    else
      render jsonapi_errors: invite
    end
  end

  def destroy
    invite = InviteResource.find(params)

    if invite.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: invite
    end
  end
end
