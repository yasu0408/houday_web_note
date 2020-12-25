NAME = "test"
EMAIL = "test@example.com"
PASSWORD = "password"

User.destroy_all
# Reception.destroy_all
user1 = User.create!(name: "太郎", email: "tarou@example.com", password: "password")
user2 = User.create!(name: "次郎", email: "jirou@example.com", password: "password")
user3 = User.create!(name: "三郎", email: "saburou@example.com", password: "password")
user = User.guest

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
user.calendars.create!(date: Date.today)
# days = [1, 2, 3, 4, 5, 6]
# workdays = (from..to).to_a.select { |k| days.include?(k.wday) }
MESSAGES = []
message1 = "今日の帰りの送迎ですが、私が１８時ごろ施設に直接お迎えに行こうと思います。よろしくおねがいします。それと来週の月曜日の学校の下校時間ですが、１５時下校から１５時３０分下校に変更したようです。"
message2 = "体調も機嫌も良いですが、施設外活動が楽しみなようで少しテンションが高いです。ご迷惑をおかけするかもしれませんが、よろしくおねがいします。本人に昼食後のお薬をもたせているので、飲んでいることを確認していただければ嬉しいです。"
message3 = "職員さんとダンボール工作をしたと嬉しそうに話をしてくれました。今日も続きをするとはりきっています。よろしくお願いします。"
MESSAGES << message1 << message2 << message3

from = Date.today - 150
to = Date.today - 1
(from..to).each do |date|
  next if date.wday == 0
  next if rand(5) == 0
  user.notes.create!(date: date, condition: Note::CONDITION.sample, humor: Note::HUMOR.sample, temp: rand(36.0..37.0).round(1), message: MESSAGES.sample)
end

puts "初期データの投入に成功しました！"
