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


  task fake_article: :environment do
    Article.destroy_all

    User.all.each do |user|
      5.times do
        category = Category.ids.sample
        article = user.articles.create!(
          title: FFaker::Book.title,
          content: FFaker::Lorem.paragraph,
          status: ['publish', 'publish', 'draft'].sample,
          category_ids: [category]
        )
      end
    end

    puts "fake articles created"
  end

end