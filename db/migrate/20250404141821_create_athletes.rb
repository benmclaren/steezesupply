class CreateAthletes < ActiveRecord::Migration[7.1]
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :nationality
      t.string :home_resort
      
      t.timestamps
    end
  end
end
