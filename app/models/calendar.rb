class Calendar < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :user_id, uniqueness: {
                        scope: :date,
                        message: "さんは利用日は１日に１回となります。",
                      }
end
