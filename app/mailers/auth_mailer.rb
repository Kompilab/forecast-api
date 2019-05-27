require 'sendgrid-ruby'
require 'events/logger'

class AuthMailer < Devise::Mailer
  include SendGrid
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default from: 'Kompilab <contact@kompilab.com>'
  default reply_to: 'Kompilab <contact@kompilab.com>'

  layout 'mailer'

  def confirmation_instructions(record, token, opts={})
    @user = record
    @confirm_url = "#{host}/auth/confirm?token=#{token}"

    if Rails.env == 'development'
      # used locally by :letter_opener
      mail(to: @user.email, subject: "#{@user.first_name}, confirm your email")
    else
      from = Email.new(email: 'contact@kompilab.com')
      to = Email.new(email: @user.email)
      subject = "#{@user.first_name}, confirm your email"

      content = Content.new(type: 'text/html', value: render(layout: 'mailer'))
      mail = Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
    end

    Events::Logger.new(
      event_name: 'auth.confirmation_email.sent',
      description: "Sent email confirmation to #{@user.first_name}, #{@user.email}",
      event_date: Date.today,
      event_type: 'email',
      user_id: @user.id
    ).log
  end

  private

  def host
    env_hosts = {
      development: 'localhost:3000',
      production: 'https://my-forecast.herokuapp.com'
    }

    env_hosts[Rails.env.to_sym]
  end
end
