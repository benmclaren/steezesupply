class Brand < ApplicationRecord
  has_many :athlete_brands
  has_many :athletes, through: :athlete_brands
  has_many :favourites
  has_one_attached :photo
  include PgSearch::Model

  pg_search_scope :search_by_name,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }

  # def to_param
  #   name.parameterize
  # end

  def set_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end
end
