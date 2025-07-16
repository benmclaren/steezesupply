class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.all
  end

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    
    
    brand = Brand.find_by!(slug: params[:brand_id])
    @favourite.brand = brand

    if @favourite.save
      redirect_to brand_path(brand)
    else
      redirect_to brand_path(brand), alert: "Failed to add to favourites"
    end
  end

end
