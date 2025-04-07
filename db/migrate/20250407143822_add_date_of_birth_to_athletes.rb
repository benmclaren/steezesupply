class AddDateOfBirthToAthletes < ActiveRecord::Migration[7.1]
  def change
    add_column :athletes, :date_of_birth, :date
  end
end
