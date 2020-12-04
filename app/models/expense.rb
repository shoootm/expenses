class Expense < ApplicationRecord
  validates :income, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end


end
