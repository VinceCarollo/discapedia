class SearchController < ApplicationController
  def index
    @search_results = SearchService.call(query: params[:q],
                                         sort_by: params[:sort_by],
                                         sort_direction: params[:sort_direction])

    render layout: false
  end
end
