# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Guest.create(name: 'Srinidhi P', email: 'srinidhi@larks.in')
Restaurant.create(name: 'Pavilion', email: 'pavilion@bar.in', phone: '+603 1234 5678')
Shift.create(name: 'Morning Shift', start_time: '9:00 AM', end_time: '1:00 PM', restaurant_id: '1')
Shift.create(name: 'Evening Shift', start_time: '5:00 PM', end_time: '11:00 PM', restaurant_id: '1')
tables = [
      {name: 'Normal', minimum_capacity: 2, maximum_capacity: 4, restaurant_id: 1},
      {name: 'Normal', minimum_capacity: 2, maximum_capacity: 4, restaurant_id: 1},
      {name: 'Normal', minimum_capacity: 2, maximum_capacity: 4, restaurant_id: 1},
      {name: 'Normal', minimum_capacity: 2, maximum_capacity: 4, restaurant_id: 1},
      {name: 'Normal', minimum_capacity: 2, maximum_capacity: 4, restaurant_id: 1},
      {name: 'Party',  minimum_capacity: 4, maximum_capacity: 8, restaurant_id: 1},
]
tables.map do |table_params|
  table = Table.new(table_params)
  unless table.save
    p table.errors
  end
end
