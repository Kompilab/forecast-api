require 'events/logger'

class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super
    Events::Logger.new(
      event_name: 'auth.login',
      description: "You logged in",
      event_date: Date.today,
      event_type: 'login',
      user_id: resource.id
    ).log
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
