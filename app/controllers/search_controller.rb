class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]

  def index
    query = params[:q].to_s.strip.downcase

    # Try to match an exact brand
    brand = Brand.search_by_name(query).first
    return redirect_to brand_path(brand) if brand

    # Try to match an athlete
    athlete = Athlete.search_by_name(query).first
    return redirect_to athlete_path(athlete) if athlete

    flash[:alert] = "No results found for '#{params[:q]}'"
    redirect_to root_path
  end
end
