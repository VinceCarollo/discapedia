class SearchController < ApplicationController
  def index
    @search_results = Disc.includes(:manufacturer)
                          .search_by_name(params[:q])
                          .order('manufacturers.name ASC, discs.name ASC')
                          .group_by(&:manufacturer)
    render layout: false
  end
end
