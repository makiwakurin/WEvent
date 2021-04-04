class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :task_users
  has_many :tasks, through: :task_users, dependent: :destroy
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


  has_many :user_events
  has_many :events, through: :user_events

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

end
