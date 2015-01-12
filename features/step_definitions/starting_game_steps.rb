When(/^I enter my name "(.*?)"$/) do |name|
  fill_in('name', with: 'Bibiana')
end

Then(/^I should see "(.*?)", "(.*?)" or "(.*?)"$/) do |arg1, arg2, arg3|
  expect(page.text).to match /(#{arg1}|#{arg2}|#{arg3})/
end

Then(/^I press hidden button "(.*?)"$/) do |button|
  find("##{button}", :visible=>false).click
end

When(/^you enter your name "(.*?)"$/) do |name|
  fill_in('name', with: 'Serafeim')
end

When(/^"(.*?)" follow "(.*?)"$/) do |selector, link|
  with_scope(selector) do
    click_link(link)
  end
end

Then(/^"(.*?)" should see "(.*?)"$/) do |name, arg2|
  fill_in('name', with: 'Bibiana')
  expect(arg2).to have_content("Please wait till your opponent makes a choice")
end
