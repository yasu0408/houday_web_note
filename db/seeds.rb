User.destroy_all
Reception.destroy_all

user1 = User.create!(name: "太郎", email: "tarou@example.com", password: "password")
user2 = User.create!(name: "次郎", email: "jirou@example.com", password: "password")
user3 = User.create!(name: "三郎", email: "saburou@example.com", password: "password")

require "Time"
require "Date"

Reception.create!(date: Date.new(2020, 9, 2), arrive: Time.new(2020, 9, 2, 15, 30), leave: Time.new(2020, 9, 2, 17, 10), user_id: user1.id)
Reception.create!(date: Date.new(2020, 9, 3), arrive: Time.new(2020, 9, 3, 15, 30), leave: Time.new(2020, 9, 3, 17, 15), user_id: user2.id)
Reception.create!(date: Date.new(2020, 9, 7), arrive: Time.new(2020, 9, 7, 15, 00), leave: Time.new(2020, 9, 7, 17), user_id: user3.id)

# Reception.create!(date: "2020,09,03", arrive: 2020-09-03 14:46:22 +0900, leave: 2020-09-03 17:49:22 +0900, user_id: user3.id)
# Reception.create!(date: "2020,09,09", arrive: 2020-09-09 15:46:33 +0900, leave: 2020-09-09 17:49:22 +0900, user_id: user3.id)
puts "初期データの投入に成功しました！"
