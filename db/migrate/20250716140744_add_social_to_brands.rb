class AddSocialToBrands < ActiveRecord::Migration[7.1]
  def change
    add_column :brands, :social, :string
  end
end
