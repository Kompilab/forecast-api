class ApplicationMailer < ActionMailer::Base
  default from: 'kompilab.17@gmail.com'
  layout 'mailer'

  def confirmation_instructions
    p 'in action mailer'
    p params
  end
end
