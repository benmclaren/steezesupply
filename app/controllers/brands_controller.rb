class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show 
    @brand = Brand.all.find { |b| b.to_param == params[:id] }
  end
end
