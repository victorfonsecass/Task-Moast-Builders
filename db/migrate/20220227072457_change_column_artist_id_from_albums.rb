class ChangeColumnArtistIdFromAlbums < ActiveRecord::Migration[6.1]
  def change
    add_reference :albums, :artist, null: false, foreign_key: true
  end
end
