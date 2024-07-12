module Admin
  class DiscsController < Admin::BaseController
    def index
      @data = Disc.includes(:manufacturer)
                  .order('manufacturers.name ASC, discs.name ASC')
                  .group_by(&:manufacturer)
    end

    def create
      @disc = Disc.new(permitted)
      if @disc.save
        flash[:notice] = "#{@disc.name} created successfully."
        redirect_to admin_discs_path
      else
        flash.now[:error] = @disc.errors.full_messages[0]
        render :new, status: :unprocessable_entity
      end
    end

    def new
      @disc = Disc.new
    end

    # rubocop:disable Metrics/AbcSize
    def update
      @disc = Disc.find(params[:id])
      if @disc.update(permitted)
        flash[:notice] = "#{@disc.name} updated successfully."
        redirect_to admin_discs_path
      else
        flash.now[:error] = @disc.errors.full_messages[0]
        render :edit, status: :unprocessable_entity
      end
    end
    # rubocop:enable Metrics/AbcSize

    def destroy
      Disc.find(params[:id]).destroy!
      flash[:notice] = 'Successfully deleted disc.'
      redirect_to admin_discs_path
    end

    def edit
      @disc = Disc.find(params[:id])
    end

    private

    def permitted
      params.require(:disc).permit(:name, :slug, :speed, :glide, :turn,
                                   :fade, :flight_chart_url, :category, :stability,
                                   :manufacturer_id)
    end
  end
end
