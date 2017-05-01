require 'rails_helper'
include Helpers

describe "Edit subject page" do
	let(:first_message) { FactoryGirl.create(:message) }
	let(:subject) { first_message.subject }
	let(:creator) { first_message.user }
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:user, admin: true) }
	let(:mod) { FactoryGirl.create(:user, moderator_category_id: subject.category.id) }

	it "is denied to unsigned user and normal user" do
			visit edit_subject_path(subject)
			expect(page).to have_content(lacking_right_message)

			sign_in(username: user.username, password: user.password)
			visit edit_subject_path(subject)
			expect(page).to have_content(lacking_right_message)
		end

		it "is allowed to admin" do
			sign_in(username: admin.username, password: admin.password)
			visit edit_subject_path(subject)
			expect(page).to have_content("Editing Subject")
		end

		it "is allowed to mod" do
			sign_in(username: mod.username, password: mod.password)
			visit edit_subject_path(subject)
			expect(page).to have_content("Editing Subject")
		end

	describe "Editing" do
		before :each do
			sign_in(username: admin.username, password: admin.password)
			visit edit_subject_path(subject)
		end

		it "doesn't succeed if input is not valid" do
			fill_in("subject_name", with: "")
			click_button("Update Subject")
			expect(page).to have_content("Name can't be blank")
		end

		it "succeeds if input is valid" do
			fill_in("subject_name", with: "New name")
			click_button("Update Subject")
			expect(page).to have_content("Subject was successfully updated.")
		end

	end

end
