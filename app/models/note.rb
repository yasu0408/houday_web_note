class Note < ApplicationRecord
  belongs_to :user
  CONDITION = ["よい", "ふつう", "わるい"]
  HUMOR = ["よい", "ふつう", "わるい"]
  validates :condition, presence: true, inclusion: { in: CONDITION }
  validates :humor, presence: true, inclusion: { in: HUMOR }
  validates :temp, presence: true
  validates :date, presence: true

  validates :user_id, uniqueness: {
                        scope: :date,
                        message: "さんは連絡帳を同日に１つしか作ることができません",
                      }
end
