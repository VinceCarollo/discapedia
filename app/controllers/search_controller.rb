class SearchController < ApplicationController
  before_action :set_sort_direction
  def index
    @search_results = Disc.search_by_name(params[:q])
                          .reorder("discs.#{sort_by} #{sort_direction}")
                          .includes(:manufacturer)
                          .group_by(&:manufacturer)
    render layout: false
  end

  private

  def sort_by
    if %w[name speed glide turn fade].include?(params[:sort_by]&.to_s)
      params[:sort_by]
    else
      'name'
    end
  end

  def sort_direction
    if %w[asc desc].include?(params[:sort_direction]&.to_s)
      params[:sort_direction]
    else
      'asc'
    end
  end

  def set_sort_direction
    params[:sort_direction] = 'asc' if params[:sort_direction].nil?
  end
end
