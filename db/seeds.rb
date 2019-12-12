
100.times do |n|
  title = Faker::Games::Pokemon.name
  content = Faker::Internet.email
  status = "未着手"
  importance = "#{rand(3)}"
  deadline = "12/11/14"
  Task.create!(title: title,
               content: content,
               status: status,
               importance: importance,
               deadline: "12/11/14"
               )
end
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
