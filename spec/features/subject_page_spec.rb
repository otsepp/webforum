require 'rails_helper'
include Helpers

describe "Subject page" do
	let(:first_message) { FactoryGirl.create(:message) }
	let(:subject) { first_message.subject }
	let(:creator) { first_message.user }
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:user, admin: true) }
	let(:mod) { FactoryGirl.create(:user, moderator_category_id: subject.category.id) }	

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
		let(:another_message) { FactoryGirl.create(:message) }
		before :each do
			subject.messages << another_message
		end

		it "is not shown to unsigned and normal users" do 
			visit subject_path(subject)
			expect(page).not_to have_link("delete", href: '/messages/2')

			sign_in(username: creator.username, password: creator.password) 
			expect(page).not_to have_link("delete", href: '/messages/2')
		end

		it "is shown admin" do 
			sign_in(username: admin.username, password: admin.password) 
			visit subject_path(subject)
			expect(page).to have_link("delete", href: '/messages/2')
		end

		it "is shown to mod" do
			sign_in(username: mod.username, password: mod.password) 
			visit subject_path(subject)
			expect(page).to have_link("delete", href: '/messages/2')
		end

		it "is not shown for first message" do
			sign_in(username: admin.username, password: admin.password) 
			visit subject_path(subject)
			expect(page).not_to have_link("delete", href: '/messages/1')
		end
	end

	describe "page navigation buttons" do
		#creates 14 messages -> total is 15, 3 pages
		let!(:messages) do
			for i in 0..14
				subject.messages << FactoryGirl.create(:message, user: user)
			end
		end

		before :each do
			visit subject_path(subject)
		end

		it "doesn't show back buttons when on first page" do
			expect(page).not_to have_css("a", class: "page-nav-button", text:"<")
			expect(page).not_to have_css("a", class: "page-nav-button", text:"<<")
		end

		it "doesn't show forward buttons when on last page" do
			click_link(">>")
			expect(page).not_to have_css("a", class: "page-nav-button", text:">")
			expect(page).not_to have_css("a", class: "page-nav-button", text:">>")
		end

		it "shows back and forward buttons correctly" do
			click_link(">")
			expect(page).to have_css("a", class: "page-nav-button", text:"<")
			expect(page).to have_css("a", class: "page-nav-button", text:"<<")
			expect(page).to have_css("a", class: "page-nav-button", text:">")
			expect(page).to have_css("a", class: "page-nav-button", text:">>")
		end

		it "buttons work" do
			click_link(">")
			expect(page).to have_css("div", class: "page-nav-button", text:"2")

			click_link("<")
			expect(page).to have_css("div", class: "page-nav-button", text:"1")

			click_link(">>")
			expect(page).to have_css("div", class: "page-nav-button", text:"#{subject.calculate_page_count}")

			click_link("<<")
			expect(page).to have_css("div", class: "page-nav-button", text:"1")
		end
	end
end




