class HomeController < ApplicationController
  def home
  end

  def contact
  end

  def search
    #Redirect to homepage if the field is empty
    if params[:search].blank?
      redirect_to(root_path, alert: "Invalid Search") and return
    else
      #Convert the input string to lowercase characters
      @parameter = params[:search].downcase
      #Trying to find recipes which title contains the input string
      @results = Recipe.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def request_contact
    name = params[:contact][:name]
    email = params[:contact][:email]
    message = params[:contact][:message]

    if email.blank?
      flash[:alert] = t('.no_email')
    else
      ContactMailer.contact_email(email, name, message).deliver_now
      flash[:notice] = t('.email_sent')
    end
    redirect_to root_path
  end

end
