
class AlbumsController < ApplicationController
    before_action :set_album, only: %i[ show edit update destroy]

  # GET /albums
  def index
    @albums = Album.includes(:user) # aumentando a velocidade de uma querry no sql
  end

  # GET
  def show
    @albums = Album.find(params[:id])
    @artist = Artist.find(params[:id])
  end

  # GET
  def new
    @album = Album.new
    @artists = Artist.all
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
    @artist = Artist.all
  end

  # POST
  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def update
    if where_modification?
      if @album.update(album_params)
        redirect_to @album, notice: 'Album was successfully dupdated'
      else
        render :edit
      end
    else
      redirect_to @album, notice: 'Action Forbidden'
    end
  end

  # DELETE
  def destroy
    if current_user.admin
      @album.destroy
      redirect_to albums_url, notice: 'Album was successfully destroyed'
    else
      redirect_to albums_path, notice: 'Action Forbidden'
    end
  end

  private
    # callbacks
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:album_name, :year, :user_id, :artist_id)
    end

    def where_modification?
      @album.user == current_user
    end
end
