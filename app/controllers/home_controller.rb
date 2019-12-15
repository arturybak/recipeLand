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
      @results = Recipe.search("%#{@parameter}%")
    end
  end

  def request_contact
    #Retrieve data from form
    name = params[:contact][:name]
    email = params[:contact][:email]
    message = params[:contact][:message]

    #Check if all fields provided
    if email.blank? || name.blank? || message.blank?
      #If not display an error message and refresh the page
      redirect_to contact_path, :alert => t('.not_enough_info')
    else
      #If all fields provided, send the message
      ContactMailer.contact_email(email, name, message).deliver_now
      #Inform the user of successful operation and redirect to homepage
      redirect_to root_path, :notice => t('.email_sent')
    end
  end

end
