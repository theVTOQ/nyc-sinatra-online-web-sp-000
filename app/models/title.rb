class Title < ActiveRecord::Base
  # add relationships
  has_many :figure_titles
  has_many :figures, through: :figure_titles

  include ApplicationRecord
end
