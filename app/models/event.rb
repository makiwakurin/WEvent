class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_many :user_events
  has_many :users, through: :user_events

  validates :name, :location, :date, :description, presence: true
  validates :genre_id, numericality: { other_than: 1 }
end

