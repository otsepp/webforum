require 'rails_helper'
include Helpers

describe "Subject page" do
	let!(:first_message) { FactoryGirl.create(:message) }
	let!(:subject) { first_message.subject }

	let(:creator) { first_message.user }
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:user, admin: true) }
	let(:mod) { FactoryGirl.create(:user, moderator_category_id: subject.category.id) }

	describe "edit subject page" do
		it "is denied to unsigned user and normal user" do
			visit edit_subject_path(subject)
			expect(page).to have_content("You lack the rights to this resource!")

			sign_in(username: user.username, password: user.password)
			visit edit_subject_path(subject)
			expect(page).to have_content("You lack the rights to this resource!")
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
	end

	describe "message creation links" do 
		before :each do
			visit subject_path(subject)
		end

		it "new message -link is shown to signed user" do
			expect(page).not_to have_content("new message")

			sign_in(username: user.username, password: user.password)
			visit subject_path(subject)
			expect(page).to have_content("new message")
		end

		it "reply -link is shown to signed user" do
			expect(page).not_to have_content("reply")

			sign_in(username: user.username, password: user.password)
			visit subject_path(subject)
			expect(page).to have_content("reply")
		end

	end

	describe "edit/delete-subject buttons" do
		it "are not shown to unsigned and normal users" do 
			visit subject_path(subject)
			expect(page).not_to have_content("edit subject")
			expect(page).not_to have_content("edit subject")

			sign_in(username: user.username, password: user.password)
			expect(page).not_to have_content("edit subject")
			expect(page).not_to have_content("edit subject")
		end

		it "are shown to admin" do 
			sign_in(username: admin.username, password: admin.password)
			visit subject_path(subject)
			expect(page).to have_content("edit subject")
			expect(page).to have_content("edit subject")
		end

		it "are shown to mod" do 
			sign_in(username: mod.username, password: mod.password)
			visit subject_path(subject)
			expect(page).to have_content("edit subject")
			expect(page).to have_content("edit subject")
		end
	end

	describe "edit message -button" do 
		it "is not shown to unsigned and normal users" do 
			visit subject_path(subject)
			expect(page).not_to have_link("edit", href: '/messages/1/edit?page=1')

			sign_in(username: user.username, password: user.password) 
			expect(page).not_to have_link("edit", href: '/messages/1/edit?page=1')
		end

		it "is shown to creator" do 
			sign_in(username: creator.username, password: creator.password) 
			visit subject_path(subject)
			expect(page).to have_link("edit", href: '/messages/1/edit?page=1')
		end

		it "is shown to admin" do 
			sign_in(username: admin.username, password: admin.password) 
			visit subject_path(subject)
			expect(page).to have_link("edit", href: '/messages/1/edit?page=1')
		end

		it "is shown to mod" do 
			sign_in(username: mod.username, password: mod.password) 
			visit subject_path(subject)
			expect(page).to have_link("edit", href: '/messages/1/edit?page=1')
		end
	end

	describe "delete message -button" do
		it "is not shown to unsigned and normal users" do 
			visit subject_path(subject)
			expect(page).not_to have_link("delete", href: '/messages/1')

			sign_in(username: creator.username, password: creator.password) 
			expect(page).not_to have_link("delete", href: '/messages/1')
		end

		it "is shown admin" do 
			sign_in(username: admin.username, password: admin.password) 
			visit subject_path(subject)
			expect(page).to have_link("delete", href: '/messages/1')
		end

		it "is shown to mod" do
			sign_in(username: mod.username, password: mod.password) 
			visit subject_path(subject)
			expect(page).to have_link("delete", href: '/messages/1')
		end
	end
end
