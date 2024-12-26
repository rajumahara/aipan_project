class Organization < ApplicationRecord
  has_one_attached :logo, dependent: :purge_later

  #   validates :name, presence :true
end
