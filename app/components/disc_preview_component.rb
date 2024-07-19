# frozen_string_literal: true

class DiscPreviewComponent < ViewComponent::Base
  def initialize(manufacturer:, discs:)
    @manufacturer = manufacturer
    @discs = discs
  end

  private

  def sort_direction
    params[:sort_direction] == 'asc' ? 'desc' : 'asc'
  end

  def disc_url(disc)
    manufacturer_disc_path(@manufacturer.slug, disc.slug)
  end
end
