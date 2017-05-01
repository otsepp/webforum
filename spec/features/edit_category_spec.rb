require 'rails_helper'
include Helpers

describe "Edit category page" do
	let!(:category) { FactoryGirl.create(:category) }

	it "is denied to unsigned users" do
		visit edit_category_path(category)
		expect(page).to have_content(lacking_right_message)
	end 

	it "is denied to non-admin users" do 
		user = FactoryGirl.create(:user)
		sign_in(username: user.username, password: user.password)
		visit edit_category_path(category)
		expect(page).to have_content(lacking_right_message)
	end

	it "isn't denied to admins" do 
		user = FactoryGirl.create(:user, admin: true)
		sign_in(username: user.username, password: user.password)
		visit edit_category_path(category)
		expect(page).to have_content("Editing Category")
	end
end 

describe "Editing category" do
	let(:category) { FactoryGirl.create(:category) }
	let(:user) { FactoryGirl.create(:user, admin: true) }

	before :each do
		sign_in(username: user.username, password: user.password)
		visit edit_category_path(category)
	end

	it "succeeds if name is valid" do
		fill_in("category_name", with: "new name")
		click_button("Update Category")
		expect(current_path).to eq(category_path(category))
		expect(page).to have_content("Category was successfully updated.")
	end

	it "doesn't succeed if name is invalid" do
		fill_in("category_name", with: "")
		click_button("Update Category")
		expect(page).to have_content("Name can't be blank")
	end
end
