class CreateAvgleMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :avgle_movies do |t|
      t.string :vid
      t.string :title
      t.float :duration
      t.boolean :hd
      t.integer :viewnumber
      t.integer :likes
      t.integer :dislikes
      t.string :video_url
      t.string :embedded_url
      t.string :preview_url

      t.timestamps
    end
  end
end
