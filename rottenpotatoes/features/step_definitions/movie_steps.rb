Given /^the following movies exist:$/ do |movies_table|
    # table is a Cucumber::Ast::Table
    movies_table.hashes.each do |movie|
        Movie.create!(movie)
    end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  m = Movie.find_by_title(arg1)
  m.director == arg2
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split.each do |rating|
    if uncheck
      uncheck("ratings_#{rating}")
    else
      check("ratings_#{rating}")
    end
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  /#{e1}(.|\n)*#{e2}/.match(page.body)
end
