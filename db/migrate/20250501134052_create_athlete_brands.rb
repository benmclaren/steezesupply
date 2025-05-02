class CreateAthleteBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :athlete_brands do |t|
      t.references :athlete, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
