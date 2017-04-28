require 'rails_helper'
include Helpers

describe "Categories page" do

	it "doesnt't show 'new category'-link if user is not logged in or is not admin" do 
		visit categories_path
		expect(page).not_to have_content("new category")

		user = FactoryGirl.create(:user)
		sign_in(username: user.username, password: user.password)
		expect(page).not_to have_content("new category")
	end

	it "shows 'new category'-link if user is admin" do 
		user = FactoryGirl.create(:user, admin: true)
		sign_in(username: user.username, password: user.password)
		expect(page).to have_content("new category")
	end	
end

describe "Category page" do
	let!(:category) { FactoryGirl.create(:category) }	

	it "shows new subject -link if user is signed in" do 
		visit category_path(category)
		expect(page).not_to have_content("new subject")

		user = FactoryGirl.create(:user)
		sign_in(username: user.username, password: user.password)
		visit category_path(category)
		expect(page).to have_content("new subject")
	end	

	it "shows edit and delete buttons to admin" do 
		user = FactoryGirl.create(:user, admin: true)
		sign_in(username: user.username, password: user.password)
		visit category_path(category)

		expect(page).to have_content("Edit")
		expect(page).to have_content("Delete")
	end	
	
	it "doesn't show edit and delete buttons to unsigned users and non-admins" do 
		visit category_path(category)
		expect(page).not_to have_content("Edit")
		expect(page).not_to have_content("Delete")

		user = FactoryGirl.create(:user)
		sign_in(username: user.username, password: user.password)
		visit category_path(category)
		expect(page).not_to have_content("Edit")
		expect(page).not_to have_content("Delete")
	end
end

describe "New category page" do 
	it "is denied to unsigned users" do
		visit new_category_path
		expect(page).to have_content("You lack the rights to this resource!")
	end 

	it "is denied to non-admin users" do 
		user = FactoryGirl.create(:user)
		sign_in(username: user.username, password: user.password)
		visit new_category_path
		expect(page).to have_content("You lack the rights to this resource!")
	end

	it "isn't denied to admins" do 
		user = FactoryGirl.create(:user, admin: true)
		sign_in(username: user.username, password: user.password)
		visit new_category_path
		expect(page).to have_content("Creating a New Category")
	end
end

describe "Edit category page" do
	let!(:category) { FactoryGirl.create(:category) }

	it "is denied to unsigned users" do
		visit edit_category_path(category)
		expect(page).to have_content("You lack the rights to this resource!")
	end 

	it "is denied to non-admin users" do 
		user = FactoryGirl.create(:user)
		sign_in(username: user.username, password: user.password)
		visit edit_category_path(category)
		expect(page).to have_content("You lack the rights to this resource!")
	end

	it "isn't denied to admins" do 
		user = FactoryGirl.create(:user, admin: true)
		sign_in(username: user.username, password: user.password)
		visit edit_category_path(category)
		expect(page).to have_content("Editing Category")
	end

end 








