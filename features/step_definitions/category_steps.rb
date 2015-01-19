And /^the following category exists "(.*)"$/ do |category_name|
  Category.create!(name: category_name)
end