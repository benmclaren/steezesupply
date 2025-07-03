class AddGearSponsorToAthletes < ActiveRecord::Migration[7.1]
  def change
     add_column :athletes, :gear_sponsor, :string
  end
end
