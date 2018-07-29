namespace :dev do

  task fake_user: :environment do
    30.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        email: "#{user_name}@example.com",
        password: "sample",
        name: "#{user_name}",
        intro: FFaker::Lorem.paragraph
      )
    end

    puts "fake users created"
  end

end