# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create!(name: "Mike Mullen", email: "mmullen227@gmail.com", password:"123456", password_confirmation: "123456", role: "admin")
user_2 = User.create!(name: "Boris", email: "boris@gmail.com", password:"123456", password_confirmation: "123456", role: "employee")
user_3 = User.create!(name: "Jose", email: "jose@gmail.com", password:"123456", password_confirmation: "123456", role: "subcontractor")
user_2 = User.create!(name: "Isabel", email: "isabel@gmail.com", password:"123456", password_confirmation: "123456", role: "admin")


task_1 = Task.create!(name: "Build Wall", description: "Install metal framing, Drill screws into drywall and metal", location: "Mount Sinai MSOP 1105")
task_2 = Task.create!(name: "Hang Door Frame and Door", description: "Install metal door frame, screw door hinges to frame", location: "Miami Jewish Bldg. 3 Apt. 405")
 
job_1 = Job.create!(name: "Mount Sinai doctor's office renovation", description: "Green Building with valet in front", location: "4300 Alton Road", date: (DateTime.now + 10000))
job_2 = Job.create!(name: "Noema's bathroom renovation", description: "Install new plumbing", location: "6578 Bird Road", date: (DateTime.now + 5000))