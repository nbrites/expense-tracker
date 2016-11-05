# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  { code: 'bills', description: 'Bills' },
  { code: 'groceries', description: 'Groceries' },
  { code: 'clothesAndShoes', description: 'Clothes & Shoes' },
  { code: 'gasAndTransportation', description: 'Gas & Transportation' },
  { code: 'restaurants', description: 'Restaurants' },
  { code: 'health', description: 'Health' },
  { code: 'travel', description: 'Travel' },
  { code: 'other', description: 'Other' }
])

expenses = Expense.create([
  { date: '01-01-2016', title: 'Running Shoes', amount: 123, category_id: Category.find_by(code: 'clothesAndShoes').id },
  { date: '05-01-2016', title: 'Winter Boots', amount: 135, category_id: Category.find_by(code: 'clothesAndShoes').id },
  { date: '15-01-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-01-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-01-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-01-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '25-01-2016', title: 'Burger King', amount: 8, category_id: Category.find_by(code: 'restaurants').id },
  { date: '15-02-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-02-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-02-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-02-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '01-03-2016', title: 'Hand X-ray', amount: 50, category_id: Category.find_by(code: 'health').id },
  { date: '15-03-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-03-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-03-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-03-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '10-04-2016', title: 'Easter Trip', amount: 600, category_id: Category.find_by(code: 'travel').id },
  { date: '15-04-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-04-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-04-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-04-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '15-05-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-05-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-05-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-05-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '15-06-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-06-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-06-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-06-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '09-07-2016', title: 'Summer Trip', amount: 500, category_id: Category.find_by(code: 'travel').id },
  { date: '15-07-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-07-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-07-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-07-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '11-08-2016', title: 'Dentist Appointment', amount: 60, category_id: Category.find_by(code: 'health').id },
  { date: '15-08-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-08-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-08-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-08-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '15-09-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-09-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-09-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-09-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '13-10-2016', title: 'General Medical Appointment', amount: 20, category_id: Category.find_by(code: 'health').id },
  { date: '15-10-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-10-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-10-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-10-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '15-11-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-11-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-11-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-11-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '26-11-2016', title: 'Joan\'s Birthday Gift', amount: 80, category_id: Category.find_by(code: 'other').id },
  { date: '15-12-2016', title: 'Gas', amount: 35, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '15-12-2016', title: 'Public Transport Pass', amount: 40, category_id: Category.find_by(code: 'gasAndTransportation').id },
  { date: '18-12-2016', title: 'Month Groceries', amount: 150, category_id: Category.find_by(code: 'groceries').id },
  { date: '19-12-2016', title: 'Month Bills', amount: 150, category_id: Category.find_by(code: 'bills').id },
  { date: '20-12-2016', title: 'Xmas Running 10Km', amount: 15, category_id: Category.find_by(code: 'other').id }
])
