class HomeController < ApplicationController
  def home
  end

  def contact
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty search") and return
    else
      @parameter = params[:search].downcase
      @results = Recipe.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end
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
