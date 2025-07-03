class Athlete < ApplicationRecord
  has_many :athlete_brands
  has_many :brands, through: :athlete_brands
  has_one_attached :photo
  include PgSearch::Model

  pg_search_scope :search_by_name,
  against: [ :first_name, :last_name ],
  using: {
    tsearch: { prefix: true }
  }

  def to_param
    "#{first_name}-#{last_name}".downcase.parameterize
  end

  def age
    return unless date_of_birth

    now = Time.zone.today
    age = now.year - date_of_birth.year
    age -= 1 if date_of_birth.change(year: now.year) > now
    age
  end
end
