class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
  # validates :first_name, presence: true

  def full_name
    [first_name, last_name].compact.join(" ")
  end

  def full_address
    [address, state, pin_code].compact.join(", ")
  end
end
