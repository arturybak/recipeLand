class ApplicationMailer < ActionMailer::Base
  default to: 'info@recipeland.com',from: 'info@recipeland.com'
  layout 'mailer'
end
