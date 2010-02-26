Given /^I entered (.*) (.*) into the storage$/ do |key, value|
  DbHash[key] = value
end

When /^I retrieve (.*)$/ do |key|
  @value = DbHash[key]
end

Then /^the result should be (.*)$/ do |value|
  value.should == @value
end