class Reception < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :arrive, presence: true
end
