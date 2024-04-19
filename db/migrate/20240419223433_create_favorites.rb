class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :artwork
      t.timestamps
    end
  end
end
