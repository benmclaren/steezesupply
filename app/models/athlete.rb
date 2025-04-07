class Athlete < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name,
  against: [ :first_name, :last_name ],
  using: {
    tsearch: { prefix: true }
  }

  def to_param
    "#{first_name}-#{last_name}".downcase.parameterize
  end
end
