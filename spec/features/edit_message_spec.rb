require 'rails_helper'
include Helpers

describe "Edit message page" do 
	let(:message) { FactoryGirl.create(:message) }
	let(:subject) { message.subject }
	let(:creator) { message.user }

	before :each do
		sign_in(username: creator.username, password: creator.password)
		visit subject_path(subject)
		click_link("edit")
	end

	it "doesn't succeed if content is blank" do
		fill_in("message_content", with: "")
		click_button("Update Message")
		expect(page).to have_content("Content can't be blank")
	end

	it "succeeds if input is invalid" do
		fill_in("message_content", with: "new content")
		click_button("Update Message")
		expect(page).to have_content("Message was successfully updated.")
	end
end
