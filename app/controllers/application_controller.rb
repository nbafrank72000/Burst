#require "application_responder"

class ApplicationController < ActionController::Base

  #self.responder = ApplicationResponder
  #respond_to :js

  #protect_from_forgery with: :exception
  include SessionsHelper

  private
   
  def logged_in_user
  	unless logged_in?
  		store_location
  		flash[:dander] = "Please log in."
  		redirect_to login_url
  	end
  end
end
