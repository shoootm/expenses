class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  with_options presence: true do
    validates :nickname
    validates :prefecture
  end
  has_many :expenses
  has_many :comments
  has_many :favorites
  has_many :favorite_expenses, through: :favorites, source: :expense
  def self.search(search)
    if search != ""
      User.where("prefecture LIKE(?)", "%#{search}%")
    else
      User.all
    end
  end
end
