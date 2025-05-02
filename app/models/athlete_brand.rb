class AthleteBrand < ApplicationRecord
  belongs_to :athlete
  belongs_to :brand
end
