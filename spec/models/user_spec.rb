require 'rails_helper'

RSpec.describe User, type: :model do

	it "returns moderator category" do 
		category  = FactoryGirl.create(:category)
		mod = FactoryGirl.create(:user)

		category.moderators << mod

		expect(mod.moderator_category).to eq(category) 
	end

	it "recognizes rights to delete and edit a subject" do 
		subject = FactoryGirl.create(:subject)
		admin = FactoryGirl.create(:user, admin: true)
		mod = FactoryGirl.create(:user)

		subject.category.moderators << mod
		user = subject.user

		expect(admin.can_edit_and_delete_subject(subject)).to eq(true)
		expect(mod.can_edit_and_delete_subject(subject)).to eq(true)
		expect(user.can_edit_and_delete_subject(subject)).to eq(false)
	end

	describe "when handling messages" do
		let!(:msg) { FactoryGirl.create(:message) }
		let!(:admin) { FactoryGirl.create(:user, admin: true) }
		let!(:mod) { FactoryGirl.create(:user) }
		let!(:user) { FactoryGirl.create(:user) }
		let!(:creator) { msg.user }

		before :each do 		
			msg.subject.category.moderators << mod
		end

		it "recognizes rights to edit a message" do 
			expect(creator.can_edit_message(msg)).to eq(true)
			expect(admin.can_edit_message(msg)).to eq(true)
			expect(mod.can_edit_message(msg)).to eq(true)
			expect(user.can_edit_message(msg)).to eq(false)
		end

		it "recognizes rights to delete a message" do 
			expect(creator.can_delete_message(msg)).to eq(false)
			expect(admin.can_delete_message(msg)).to eq(true)
			expect(mod.can_delete_message(msg)).to eq(true)
			expect(user.can_delete_message(msg)).to eq(false)
		end

	end
end
