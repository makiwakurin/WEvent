class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_many :tasks, dependent: :destroy

  validates :name, :location, :date, :description, presence: true
  validates :genre_id, numericality: { other_than: 1 }
end

