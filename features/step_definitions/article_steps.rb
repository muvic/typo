And /^the following articles:$/ do |table|
  table.hashes.each do |article|
    article[:user_id] = User.find_by_name(article[:author]).id
    Article.create! article
  end
end

And /^the following users:$/ do |table|
  table.hashes.each do |user|
    User.create! user
  end
end

And /^the following comments:$/ do |table|
  table.map_column!(:article_id) {|title| Article.find_by_title(title).id}
  table.hashes.each do |comment|
    Comment.create! comment
  end
end

And /^I am logged in as "(.*)" with the password "(.*)"$/ do |user, password|
  visit '/accounts/login'
  fill_in 'user_login', :with => user
  fill_in 'user_password', :with => password
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /^I should see the body of article "(.*)"$/ do |title|
  article_body = Article.find_by_title(title).body
  page.should have_content article_body
end

And /^I fill in Article ID with the id of "(.*)" article$/ do |title|
  fill_in 'merge_with', :with => Article.find_by_title(title)
end

Then /^the merged article should contain the text of "(.*)" and "(.*)"$/ do |title_0, title_1|
  articles = Article.where(title: title_0).order('created_at ASC')
  merged_article_body = articles[0].body
  article_0_body = articles[1].body
  article_1_body = Article.find_by_title(title_1).body
  merged_article_body.should match article_0_body + article_1_body
end

Then /^I should see two articles with the title "(.*?)" and authored by the "(.*?)"$/ do |title, author|
  page.should match /title.*author.*title.*author/
end

Then /^"(.*)" should have "(.*)" comments$/ do |title, count|
  Article.find_by_title(title).order('created_at ACS')[1].comments.count.should equal? count.to_i
end

Then /^merged from "(.*)" and "(.*)" article should have "(.*)" comments$/ do |article_0, article_1, count|
  Article.find_by_title(article_0).order('created_at ACS')[0].comments.count.should equal? count.to_i
end

