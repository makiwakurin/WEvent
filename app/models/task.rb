class Task < ApplicationRecord
  attr_accessor :user_id, :event_id
  belongs_to :user
  belongs_to :event

  validates :name, presence: true, length:{maximum: 30}
  validates :description, length:{maximum: 200}
  validates :deadline, presence: true
  validate :deadline_cannot_be_in_the_past

  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "can't be in the past")
    end
  end
end
