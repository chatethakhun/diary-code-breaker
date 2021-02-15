class AddFrameRateToAvgleMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :avgle_movies, :framerate, :float
  end
end
