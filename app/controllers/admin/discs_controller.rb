module Admin
  class DiscsController < Admin::BaseController
    def index
      @discs = Disc.includes(:manufacturer)
                   .order('manufacturers.name ASC, discs.name ASC')
    end

    def edit
      @disc = Disc.find(params[:id])
    end
  end
end
