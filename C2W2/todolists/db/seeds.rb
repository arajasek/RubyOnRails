# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

Profile.create! [
  { first_name: "Carly", last_name: "Fiorina", gender: "female",
    birth_year: 1954, user_id: 1 },
  { first_name: "Donald", last_name: "Trump", gender: "male",
    birth_year: 1946, user_id: 2 },
  { first_name: "Ben", last_name: "Carson", gender: "male",
    birth_year: 1951, user_id: 3 },
  { first_name: "Hillary", last_name: "Clinton", gender: "female",
    birth_year: 1947, user_id: 4 },
]

User.create! [
  { username: "Fiorina", password_digest: "whoops" },
  { username: "Trump", password_digest: "hitler" },
  { username: "Carson", password_digest: "neurosurgeon" },
  { username: "Clinton", password_digest: "HRC2016" }
]

User.all.each do |u|
  TodoList.create! [
    { list_name: "#{u.username}_list", list_due_date: Date.today + 1.year, user_id: u.id }
  ]
end

TodoList.all.each do |t|
  5.times do
    TodoItem.create! [
      { due_date: Date.today + 1.year, title: "itemblah",
        description: "blah blah", todo_list_id: t.id }
    ]
  end
end







