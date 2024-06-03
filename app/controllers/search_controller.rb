class SearchController < ApplicationController
  def index
    @search_results = Disc.all

    render layout: false
  end
end
