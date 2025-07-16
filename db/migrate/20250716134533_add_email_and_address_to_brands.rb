class AddEmailAndAddressToBrands < ActiveRecord::Migration[7.1]
  def change
    add_column :brands, :email, :string
    add_column :brands, :address, :string
  end
end
