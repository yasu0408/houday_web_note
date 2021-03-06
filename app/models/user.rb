class User < ApplicationRecord
  has_many :receptions, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :calendars, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "やまだ たろう"
    end
  end
end
