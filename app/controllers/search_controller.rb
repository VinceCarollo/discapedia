class SearchController < ApplicationController
  def index
    @search_results = Disc.search_by_name(params[:q])
                          .order(:manufacturer_id)
                          .group_by(&:manufacturer)

    render layout: false
  end
end
