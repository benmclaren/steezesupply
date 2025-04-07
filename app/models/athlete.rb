class Athlete < ApplicationRecord
  def to_param
    "#{first_name}-#{last_name}".downcase.parameterize
  end
end
