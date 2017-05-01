require 'rails_helper'
include Helpers

describe "Deleting a category" do

	it "works" do
		category = FactoryGirl.create(:category)

		user = FactoryGirl.create(:user, admin: true)
		sign_in(username: user.username, password: user.password)

		visit category_path(category)
		click_link("Delete")
		expect(current_path).to eq(categories_path)
		expect(page).to have_content("Category was successfully destroyed.")
		expect(Category.count).to eq(0)
	end
end

describe "Deleting a subject" do
	it "works" do
		msg = FactoryGirl.create(:message)
		subject = msg.subject
		category = subject.category
	
		user = FactoryGirl.create(:user, admin: true)
		sign_in(username: user.username, password: user.password)

		visit subject_path(subject)
		click_link("delete subject")
		expect(current_path).to eq(category_path(category))
		expect(page).to have_content("Subject was successfully destroyed.")
		expect(Subject.count).to eq(0)
		expect(Message.count).to eq(0)
	end
end

describe "Deleting a message" do

	it "works" do
		msg1 = FactoryGirl.create(:message)
		subject = msg1.subject 
		msg2 = FactoryGirl.create(:message, subject: subject)

		user = FactoryGirl.create(:user, admin: true)
		sign_in(username: user.username, password: user.password) 

		visit subject_path(subject)
		click_link("delete")
		expect(current_path).to eq(subject_path(subject))
		expect(page).to have_content("Message was successfully destroyed.")
		expect(Message.count).to eq(1)
	end	
end


