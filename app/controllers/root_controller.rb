class RootController < ApplicationController

  add_breadcrumb "<span class=\"glyphicon glyphicon-home\"></span>".html_safe, :root_path

  def index
  end
end
