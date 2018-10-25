class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    p '***sign_up_params'
    p sign_up_params
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end
end
