class ArtworkImage < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.references :artwork
      t.string :url
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
