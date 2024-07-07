module Admin
  class DiscsController < Admin::BaseController
    def index
      @data = Disc.includes(:manufacturer)
                  .order('manufacturers.name ASC, discs.name ASC')
                  .group_by(&:manufacturer)
    end

    def new
      @disc = Disc.new
    end

    def update
      @disc = Disc.find(params[:id])
      if @disc.update(permitted)
        redirect_to admin_discs_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      Disc.find(params[:id]).destroy!

      redirect_to admin_discs_path
    end

    def edit
      @disc = Disc.find(params[:id])
    end

    private

    def permitted
      params.require(:disc).permit(:name, :slug, :speed, :glide, :turn,
                                   :fade, :flight_chart_url)
    end
  end
end
