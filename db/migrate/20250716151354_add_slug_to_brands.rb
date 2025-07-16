class AddSlugToBrands < ActiveRecord::Migration[7.1]
  def change
    add_column :brands, :slug, :string
  end
end
