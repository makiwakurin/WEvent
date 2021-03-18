class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :events, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  with_options presence: true do
    validates :nickname
    validates :gender_id
    validates :hobby
    validates :comment
    validates :age
    validates :prefecture_id
    validates :city
    validates :address
  end
end
