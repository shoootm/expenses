class Expense < ApplicationRecord
  validates :income, presence: true
  belongs_to :user
  has_many :comments
end
