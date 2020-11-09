class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
    validates :birth_date
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
