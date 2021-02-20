class Task < ApplicationRecord
  belogns_to :user
  belong_to :event

  validates :name, presence: true, length:{maximum 30},
  validates :description, length:{maximum 200},
  validates :deadline
end
