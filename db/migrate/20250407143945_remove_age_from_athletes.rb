class RemoveAgeFromAthletes < ActiveRecord::Migration[7.1]
  def change
    remove_column :athletes, :age, :integer
  end
end
