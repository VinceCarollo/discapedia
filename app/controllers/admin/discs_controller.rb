module Admin
  class DiscsController < Admin::BaseController
    def index
      @data = Disc.includes(:manufacturer)
                  .order('manufacturers.name ASC, discs.name ASC')
                  .group_by(&:manufacturer)
    end

    def update
      Disc.find(params[:id]).update(permitted)
      redirect_to admin_discs_path
    end

    def edit
      @disc = Disc.find(params[:id])
    end

    private

    def permitted
      params.require(:disc).permit(:name, :slug, :speed, :glide, :turn,
                                   :fade, :diameter, :height, :rim_depth,
                                   :rim_width, :image, :buy_url)
    end
  end
end
