class Expense < ApplicationRecord
  validates :income, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites#, dependent: :destroy
  has_many :favorite_counts
end
