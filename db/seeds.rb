# Default admin

User.create(email: "admin@example.com", password: "12345678", role: "admin")
puts "Default admin created!"

# Category

Category.destroy_all

category_list = [
  { name: "旅遊" },
  { name: "美食" },
  { name: "電影" },
  { name: "音樂" },
  { name: "星座" },
  { name: "動漫" },
  { name: "運動" }
]

category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category created!"
