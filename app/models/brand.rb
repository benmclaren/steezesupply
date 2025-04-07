class Brand < ApplicationRecord
  has_one_attached :photo

  def to_param
    name.parameterize
  end
end
