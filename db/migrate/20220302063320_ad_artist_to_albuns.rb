class AdArtistToAlbuns < ActiveRecord::Migration[6.1]
  def change
    add_reference :albums, :artist
  end
end
