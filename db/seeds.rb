# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.find_or_create_by(first_name: 'admin', last_name: 'admin', email: 'admin@localhost')
admin.password = 'admin'
admin.save

2.times do |i|
  u = Manager.new
  u.email = "manageremail#{i}@mail.gen"
  u.first_name = "manager FN#{i}"
  u.last_name = "LN#{i}"
  u.password = i.to_s
  u.save
end

4.times do |i|
  u = Developer.new
  u.email = "devemail#{i}@mail.gen"
  u.first_name = "devFN#{i}"
  u.last_name = "LN#{i}"
  u.password = i.to_s
  u.save
end

Developer.find_each do |developer|
  4.times do |i|
    t = Task.new
    t.author = if i % 2 === 0
                 Manager.first
               else
                 Manager.last
               end
    t.name = "Test #{i} #{developer.first_name}"
    t.description = "test #{i} #{developer.first_name}  #{developer.last_name}"
    t.assignee_id = developer
    t.save
  end
end
