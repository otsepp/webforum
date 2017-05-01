require 'rails_helper'
include Helpers

describe "New subject page" do
	let(:category) { FactoryGirl.create(:category) }
	let(:user) { FactoryGirl.create(:user) }
	
	it "redirects home when category isn't found" do
		visit new_subject_path
		expect(current_path).to eq(root_path)
		expect(page).to have_content("Category was not found")
	end

	it "is denied to unsigned user" do
		visit "subjects/new?new_subject_category_id=#{category.id}"
		expect(page).to have_content(lacking_right_message)
	end

	it "is allowed to signed user" do
		sign_in(username: user.username, password: user.password)
		visit "subjects/new?new_subject_category_id=#{category.id}"
		expect(page).to have_content("New Subject")
	end

	it "remembers category in session" do
		sign_in(username: user.username, password: user.password)
		visit "subjects/new?new_subject_category_id=#{category.id}"

		visit root_path
		visit new_subject_path
		expect(page).to have_content("New Subject")
	end
end

describe "Creating a subject" do
	let(:category) { FactoryGirl.create(:category) }
	let(:user) { FactoryGirl.create(:user) }

	before :each do
		sign_in(username: user.username, password: user.password)
	end

	it "doesn't succeed if input is not valid" do
		visit "subjects/new?new_subject_category_id=#{category.id}"
		click_button('Create Subject')
		expect(page).to have_content("Name can't be blank")
		expect(page).to have_content("Content cannot be empty")

		fill_in("subject_name", with: "subject name")
		click_button('Create Subject')
		expect(page).not_to have_content("Name can't be blank")
		expect(page).to have_content("Content cannot be empty")

		fill_in("subject_name", with: "")
		fill_in("content", with: "some content")
		click_button('Create Subject')
		expect(page).to have_content("Name can't be blank")
		expect(page).not_to have_content("Content cannot be empty")

		expect(Subject.count).to eq(0)
		expect(Message.count).to eq(0)
	end

	it "succeeds if input is valid" do
		visit "subjects/new?new_subject_category_id=#{category.id}"
		fill_in("subject_name", with: "a subject")
		fill_in("content", with: "some content")
		click_button('Create Subject')
		
		expect(current_path).to eq(subject_path(Subject.first))
		expect(page).to have_content("Subject was successfully created.")

		expect(Subject.count).to eq(1)
		expect(Message.count).to eq(1)
		expect(Subject.first.messages.first).to eq(Message.first)
	end

end
