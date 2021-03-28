class Task < ApplicationRecord
  attr_accessor :user_id, :event_id
  belongs_to :user
  belongs_to :event

  # validates :user_id, presence: true, numericality: { other_than: 1, message: "in charge must be checked"}
  validates :name, presence: true, length:{maximum: 30}
  validates :description, length:{maximum: 200}
  validates :deadline, presence: true
  validate :deadline_cannot_be_in_the_past
  # validate :user_id_must_exist

  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "can't be in the past")
    end
  end

private

def user_id_must_exist
  if user_id = ""
    errors.add(:user_id, "person in charge must be checked")
  end
end

end
