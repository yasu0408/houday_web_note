class Reception < ApplicationRecord
  belongs_to :user
  validates :arrive, presence: true
end
