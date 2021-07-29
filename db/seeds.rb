# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
JobApplication.destroy_all
User.destroy_all

michael = User.create username: "michael", password: '123'

JobApplication.create([
    {company_name: "TextUs", position: "Junior Ruby on rails engineer", date_applied: "11/07/2021", salary: 75_000, follow_up: false, user: michael},
    {company_name: "Facebook", position: "Mid-level React engineer", date_applied: "25/06/2021", salary: 100_000, follow_up: false, user: michael},
    {company_name: "Slack", position: "Backend Software engineer", date_applied: "30/06/2021", salary: 90_000, follow_up: false, user: michael}
])
