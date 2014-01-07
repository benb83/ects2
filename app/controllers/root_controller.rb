class RootController < ApplicationController

  add_breadcrumb "<span class=\"glyphicon glyphicon-home\"></span>".html_safe, :root_path

  def index
  	if user_signed_in?
  		render 'dashboard'
  	end
  end

end
