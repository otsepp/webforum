require 'rails_helper'
include Helpers

describe "New category page" do 
	it "is denied to unsigned users" do
		visit new_category_path
		expect(page).to have_content(lacking_right_message)
	end 

	it "is denied to non-admin users" do 
		user = FactoryGirl.create(:user)
		sign_in(username: user.username, password: user.password)
		visit new_category_path
		expect(page).to have_content(lacking_right_message)
	end

	it "isn't denied to admins" do 
		user = FactoryGirl.create(:user, admin: true)
		sign_in(username: user.username, password: user.password)
		visit new_category_path
		expect(page).to have_content("Creating a New Category")
	end
end

describe "Creating a new category" do
	let(:user) { FactoryGirl.create(:user, admin: true) }

	before :each do
		sign_in(username: user.username, password: user.password)
		visit new_category_path
	end

	it "succeeds if name is valid" do
		fill_in("category_name", with: "category name")
		click_button("Create Category")
		expect(current_path).to eq(categories_path)
		expect(page).to have_content("Category was successfully created.")
		expect(Category.count).to eq(1)
	end

	it "doesnt succeed if name is invalid" do
		fill_in("category_name", with: "")
		click_button("Create Category")
		expect(page).to have_content("Name can't be blank")
	end

end
