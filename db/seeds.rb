puts "Seeding Kairan platform..."

# Create admin user
admin = User.find_or_create_by!(email: "admin@kairan.ru") do |u|
  u.password = "admin123"
  u.first_name = "Администратор"
  u.last_name = "Системы"
  u.phone = "+7 (999) 000-00-00"
  u.role = :system_admin
  u.status = :active
end
puts "  Admin: #{admin.email} / admin123"

# Create test instructor
instructor = User.find_or_create_by!(email: "instructor@kairan.ru") do |u|
  u.password = "instructor123"
  u.first_name = "Иван"
  u.last_name = "Петров"
  u.phone = "+7 (999) 111-11-11"
  u.role = :instructor
  u.status = :active
end
puts "  Instructor: #{instructor.email} / instructor123"

# Create test participant
participant = User.find_or_create_by!(email: "user@kairan.ru") do |u|
  u.password = "user123"
  u.first_name = "Мария"
  u.last_name = "Сидорова"
  u.phone = "+7 (999) 222-22-22"
  u.role = :participant
  u.status = :active
end
puts "  Participant: #{participant.email} / user123"

# Create franchise
franchise = Franchise.find_or_create_by!(title: "Kairan Центр") do |f|
  f.owner = admin
  f.status = :active
end
puts "  Franchise: #{franchise.title}"

# Create points
point = Point.find_or_create_by!(title: "База на Воробьёвых горах") do |p|
  p.point_type = :base
  p.franchise = franchise
  p.lat = 55.7558
  p.lng = 37.6173
  p.address = "Москва, Воробьёвы горы"
  p.status = :active
end
puts "  Point: #{point.title}"

Point.find_or_create_by!(title: "Прокат в Серебряном Бору") do |p|
  p.point_type = :franchise
  p.franchise = franchise
  p.lat = 55.7768
  p.lng = 37.4076
  p.address = "Москва, Серебряный Бор"
  p.status = :active
end
puts "  Point: Серебряный Бор"

# Create boats
["KRN-001", "KRN-002", "KRN-003"].each do |sn|
  Boat.find_or_create_by!(serial_number: sn) do |b|
    b.point = point
    b.boat_type = "Надувная лодка"
    b.color = ["Красный", "Синий", "Зелёный"].sample
    b.capacity = 4
    b.status = :available
    b.condition_level = :excellent
  end
end
puts "  Boats: 3 created"

# Create route
route = Route.find_or_create_by!(title: "Москва-река: Воробьёвы горы — Парк Горького") do |r|
  r.description = "Живописный маршрут по Москве-реке вдоль набережных"
  r.difficulty = :easy
  r.distance_km = 8.5
  r.estimated_duration = 60
  r.route_type = :water
  r.status = :active
end
puts "  Route: #{route.title}"

# Create route points
RoutePoint.find_or_create_by!(route: route, order_index: 0) do |rp|
  rp.title = "Старт — Воробьёвы горы"
  rp.lat = 55.7558
  rp.lng = 37.6173
  rp.checkpoint_type = :start
end

RoutePoint.find_or_create_by!(route: route, order_index: 1) do |rp|
  rp.title = "Нескучный сад"
  rp.lat = 55.7358
  rp.lng = 37.6073
  rp.checkpoint_type = :waypoint
end

RoutePoint.find_or_create_by!(route: route, order_index: 2) do |rp|
  rp.title = "Финиш — Парк Горького"
  rp.lat = 55.7258
  rp.lng = 37.5973
  rp.checkpoint_type = :finish
end
puts "  Route points: 3 created"

# Create an event
event = Event.find_or_create_by!(title: "Вечерняя тренировка") do |e|
  e.event_type = :training
  e.description = "Вечерняя тренировка на байдарках для начинающих"
  e.start_time = Time.current + 1.day + 18.hours
  e.end_time = Time.current + 1.day + 20.hours
  e.point = point
  e.route = route
  e.user = instructor
  e.status = :planned
  e.visibility = :public_event
end
puts "  Event: #{event.title}"

Event.find_or_create_by!(title: "Воскресный маршрут") do |e|
  e.event_type = :route
  e.description = "Воскресная прогулка по маршруту"
  e.start_time = Time.current + 3.days + 10.hours
  e.end_time = Time.current + 3.days + 13.hours
  e.point = point
  e.route = route
  e.user = instructor
  e.status = :planned
  e.visibility = :public_event
end
puts "  Event: Воскресный маршрут"

# Create a team
team = Team.find_or_create_by!(title: "Драконы Москвы") do |t|
  t.captain = participant
  t.status = :active
end
puts "  Team: #{team.title}"

puts "\nDone! Users: admin@kairan.ru/admin123, instructor@kairan.ru/instructor123, user@kairan.ru/user123"
