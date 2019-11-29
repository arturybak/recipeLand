class ContactMailer < ApplicationMailer

  def contact_email(email, name, message)
    @email = email
    @name = name
    @message = message

    mail cc: @email
  end
end
