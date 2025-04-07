class BrandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @brands = Brand.all
  end

  def show 
    @brand = Brand.all.find { |b| b.to_param == params[:id] }
  end
end
