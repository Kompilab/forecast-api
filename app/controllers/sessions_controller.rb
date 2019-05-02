require 'events/logger'

class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)

    Events::Logger.new(
        event_name: 'auth.login',
        description: "You logged in",
        event_date: Date.today,
        event_type: 'login',
        user_id: resource.id
    ).log

    sign_in(resource_name, resource)
    render_resource(resource)
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
