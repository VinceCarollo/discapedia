class HomeController < ApplicationController
  def index
    @disc = Disc.find_by(slug: params[:disc])
  end
end
