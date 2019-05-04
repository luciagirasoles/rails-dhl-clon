class HomeController < ApplicationController
  skip_before_action :authentication

  def index

  end
end