class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :expense
  has_one :favorite_count
end
