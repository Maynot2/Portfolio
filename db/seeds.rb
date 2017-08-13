# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

10.times do
  Blog.create!(
      title: Faker::ChuckNorris.fact,
      body: Faker::Lorem.paragraph(2, true, 4)
    )
end

puts "10 blog posts created"

5.times do
  Skill.create!(
      title: Faker::Superhero.power,
      percent_utilized: Faker::Number.between(1, 100)
    )
end

puts "5 skills created"

9.times do
  Portfolio.create!(
      title: Faker::Internet.domain_name,
      subtitle: Faker::Hacker.adjective,
      body: Faker::Hacker.say_something_smart,
      main_image: Faker::LoremPixel.image,
      thumb_image: Faker::LoremPixel.image("50x60")
    )
end

puts "9 portfolios created"
