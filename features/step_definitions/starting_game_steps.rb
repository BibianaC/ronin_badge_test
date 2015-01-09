When(/^I enter my name "(.*?)"$/) do |name|
  fill_in('name', with: 'Bibiana')
end

Then(/^I should see "(.*?)", "(.*?)" or "(.*?)"$/) do |arg1, arg2, arg3|
  expect(page.text).to match /(#{arg1}|#{arg2}|#{arg3})/
end
