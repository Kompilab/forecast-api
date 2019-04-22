class AuthMailer < Devise::Mailer
  # helper :application
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default from: 'Kompilab <kompilab.17@gmail.com>'
  default reply_to: 'Kompilab <kompilab.17@gmail.com>'

  layout 'mailer'

  def confirmation_instructions(record, token, opts={})
    @user = record
    @confirm_url = "#{host}/auth/confirm?token=#{token}"

    mail(to: @user.email, subject: 'Confirm your email')
  end

  private

  def host
    env_hosts = {
      development: 'localhost:5000',
      production: 'http://my-forecast.herokuapp.com'
    }

    env_hosts[Rails.env.to_sym]
  end
end
