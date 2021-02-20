class Task < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :name, presence: true, length:{maximum: 30}
  validates :description, length:{maximum: 200}
  validates :deadline, length:{in: 5..20}
end
