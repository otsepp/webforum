require 'rails_helper'
include Helpers

describe "New message page" do 
	let(:message) { FactoryGirl.create(:message) }
	let(:subject) { message.subject }
	let(:user) { FactoryGirl.create(:user) }

	it "is denied to unsigned users" do
		visit "messages/new?subject_id=#{subject.id}"
		expect(page).to have_content("You lack the rights to this resource!")
	end

	it "redirects when subject isn't found" do
		visit new_message_path
		expect(current_path).to eq(root_path)
		expect(page).to have_content("Subject was not found")
	end

	it "remembers subject in session" do
		sign_in(username: user.username, password: user.password)

		visit subject_path(subject)
		click_link("new message")

		visit new_message_path
		expect(page).to have_content(subject.name)
	end
end

describe "Creating a message" do
	let(:message) { FactoryGirl.create(:message) }
	let(:subject) { message.subject }
	let(:user) { FactoryGirl.create(:user) }

	before :each do
		sign_in(username: user.username, password: user.password)
		visit subject_path(subject)	
		click_link("new message")
	end	

	it "doesn't succeed if input is not valid" do
		click_button("Create Message")
		expect(page).to have_content("Content can't be blank")
		expect(Message.count).to eq(1)
	end

	it "succeeds if input is valid" do
		fill_in("message_content", with: "some content")
		click_button("Create Message")
		expect(current_path).to eq(subject_path(subject))
		expect(page).to have_content("Message was successfully created.")

		expect(Message.count).to eq(2)
		expect(Message.last.subject).to eq(subject)
	end
end

describe "Replying" do
	let(:message) { FactoryGirl.create(:message) }
	let(:subject) { message.subject }
	let(:user) { FactoryGirl.create(:user) }

	before :each do
		sign_in(username: user.username, password: user.password)
		visit subject_path(subject)
		click_link("reply")
	end	

	it "page shows quote" do
		expect(page).to have_css("div", class:"message-bottom-bar-quote", text: message.content)
	end

	it "page remembers quote in session" do
		visit new_message_path
		expect(page).to have_css("div", class:"message-bottom-bar-quote", text: message.content)
	end

	it "page forgets quote" do
		visit subject_path(subject)
		click_link("new message")
		expect(page).not_to have_css("div", class:"message-bottom-bar-quote", text: message.content)
	end

	it "succeeds and redirects to last page of subject" do
		fill_in("message_content", with: "some content")
		click_button("Create Message")
		expect(Message.count).to eq(2)
		expect(Message.last.subject).to eq(subject)
		expect(Message.last.quote).to eq(message)
		expect(page).to have_css("div", class:"page-nav-button", text: "#{subject.calculate_page_count}")
	end

end
