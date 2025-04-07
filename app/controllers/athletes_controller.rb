class AthletesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.all.find { |b| b.to_param == params[:id] }
  end

end
