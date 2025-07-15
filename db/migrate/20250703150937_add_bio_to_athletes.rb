class AddBioToAthletes < ActiveRecord::Migration[7.1]
  def change
    add_column :athletes, :bio, :text
  end
end
