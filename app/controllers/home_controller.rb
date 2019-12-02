class HomeController < ApplicationController
  def home
  end

  def contact
  end

  def request_contact
    name = params[:contact][:name]
    email = params[:contact][:email]
    message = params[:contact][:message]

    if email.blank?
      flash[:alert] = I18n.t('contact.request_contact.no_email')
    else
      ContactMailer.contact_email(email, name, message).deliver_now
      flash[:notice] = I18n.t('contact.request_contact.email_sent')
    end
    redirect_to root_path
  end

end
