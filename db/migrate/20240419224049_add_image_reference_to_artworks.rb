class AddImageReferenceToArtworks < ActiveRecord::Migration[7.1]
  def change
    add_reference :artworks, :image
  end
end
