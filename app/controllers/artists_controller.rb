
class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update]

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  # POST
  def create
    @artist = Artist.new(artist_params)
  end

  private
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end
end
