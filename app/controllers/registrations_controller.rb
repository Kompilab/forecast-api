class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save

    Events::Logger.new(
      event_name: 'auth.register',
      description: "Account created - #{resource.email}",
      event_date: Date.today,
      event_type: 'register',
      user_id: resource.id
    ).log

    render_resource(resource)
  end
end
