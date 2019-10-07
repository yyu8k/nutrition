class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true

  with_options presence: true do
    validates :first_name
    validates :first_name_kana
    validates :last_name
    validates :last_name_kana
    validates :phone_number
    validates :birthday
    validates :sex
    validates :height
    validates :weight
  end

  has_many :records
  has_many :foods

end

# 「presence: true」は、空でないことを意味する