class RemoveAthleteIdFromFavourites < ActiveRecord::Migration[7.1]
  def change
    remove_reference :favourites, :athlete, null: false, foreign_key: true
  end
end
