class DiscsController < ApplicationController
  def show
    @manufacturer = Manufacturer.find_by(slug: params[:manufacturer_slug])
    @disc = @manufacturer.discs.find_by(slug: params[:slug])
  end
end
