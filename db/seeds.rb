NAME = "test"
EMAIL = "test@example.com"
PASSWORD = "password"

User.destroy_all
# Reception.destroy_all
user = User.guest
user1 = User.create!(name: "太郎", email: "tarou@example.com", password: "password")
user2 = User.create!(name: "次郎", email: "jirou@example.com", password: "password")
user3 = User.create!(name: "三郎", email: "saburou@example.com", password: "password")

# require "Time"
# require "Date"

user1.receptions.create!(arrive: Time.new(2020, 12, 2, 15, 30), leave: Time.new(2020, 12, 2, 17, 10), user_id: user1.id)
user2.receptions.create!(arrive: Time.new(2020, 12, 1, 16, 30), leave: Time.new(2020, 9, 7, 18, 5), user_id: user2.id)
user2.receptions.create!(arrive: Time.current, user_id: user2.id)
user3.receptions.create!(arrive: Time.new(2020, 9, 11, 15, 20), leave: Time.new(2020, 9, 11, 18, 00), user_id: user3.id)
user3.receptions.create!(arrive: Time.current, leave: Time.current, user_id: user3.id)

user1.notes.create!(date: Time.new(2020, 12, 2, 10, 10), condition: "よい", humor: "ふつう", temp: 36.5, message: "サンプル文です")
user2.notes.create!(date: Time.new(2020, 12, 1, 11, 20), condition: "ふつう", humor: "ふつう", temp: 36.6, message: "あああ")
user2.notes.create!(date: Time.current, condition: "わるい", humor: "わるい", temp: 36.6, message: "サンプル文です")
user3.notes.create!(date: Time.new(2020, 9, 11, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です")
user3.notes.create!(date: Time.current, condition: "ふつう", humor: "ふつう", temp: 36.7, message: "サンプル文です")

user1.calendars.create!(date: Date.new(2020, 12, 2))
user2.calendars.create!(date: Date.new(2020, 12, 1))
user2.calendars.create!(date: Date.new(2020, 12, 8))
user3.calendars.create!(date: Date.new(2020, 12, 10))
user3.calendars.create!(date: Date.new(2020, 12, 12))

# user.create!(name: NAME, email: EMAIL, password: PASSWORD)
user.receptions.create!(arrive: Time.current, user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 11, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 12, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 14, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 15, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 16, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 17, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 18, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 19, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 21, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 22, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 23, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 24, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 25, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 26, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 28, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 29, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 9, 30, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 10, 1, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 10, 2, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)
user.notes.create!(date: Time.new(2020, 10, 3, 9, 30), condition: "よい", humor: "よい", temp: 36.7, message: "サンプル文です", user_id: user.id)

puts "初期データの投入に成功しました！"
