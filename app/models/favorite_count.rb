class FavoriteCount < ApplicationRecord
  belongs_to :expense
  has_many :favorites
end
