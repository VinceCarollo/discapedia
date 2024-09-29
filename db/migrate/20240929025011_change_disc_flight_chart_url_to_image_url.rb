class ChangeDiscFlightChartUrlToImageUrl < ActiveRecord::Migration[7.1]
  def change
    rename_column :discs, :flight_chart_url, :image_url
  end
end
