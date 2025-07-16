class AddBioToBrands < ActiveRecord::Migration[7.1]
  def change
    add_column :brands, :bio, :text
  end
end
