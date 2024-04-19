class CreateArtworks < ActiveRecord::Migration[7.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.integer :date_start
      t.integer :date_end
      t.string :date_display
      t.string :artist_display
      t.string :place_of_origin
      t.string :description
      t.string :short_description
      t.string :dimensions
      t.string :medium_display
      t.string :credit_line
      t.string :term_titles, array: true, default: []

      t.timestamps
    end
  end
end
