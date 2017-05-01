require 'rails_helper'
include Helpers

describe "Signing up" do
	before :each do
		visit signup_path
	end	

	it "is denied from signed in users" do
		user = FactoryGirl.create(:user)
		sign_in(username: user.username, password: user.password)
		visit signup_path
		expect(current_path).to eq(root_path)
	end

	it "doesn't succeed if input is empty" do
		click_button("Create User")
		expect(page).to have_content("Username can't be blank")
		expect(page).to have_content("Password can't be blank")
	end

	it "doesn't succeed if password and its confirmation don't match" do
		fill_in("user_username", with: "Foob")
		fill_in("user_password", with: "pass")
		fill_in("user_password_confirmation", with: "wargh")

		click_button("Create User")
		expect(page).to have_content("Password confirmation doesn't match Password")
	end

	it "succeeds if input is valid" do
		fill_in("user_username", with: "Foob")
		fill_in("user_password", with: "pass")
		fill_in("user_password_confirmation", with: "pass")

		click_button("Create User")
		expect(page).to have_content("User was successfully created.")
		expect(User.count).to eq(1)
	end
end

describe "Signing in" do
	let!(:user) { FactoryGirl.create(:user, username: "tester") }

	before :each do
		visit signin_path
	end

	it "is denied from signed in users" do
		user = FactoryGirl.create(:user)
		sign_in(username: user.username, password: user.password)
		visit signin_path
		expect(current_path).to eq(root_path)
	end

	it "doesn't succeed if input is invalid" do	
		click_button("Log in")
		expect(page).to have_content("Username and/or password mismatch")
	end

	it "succeeds if input is valid" do
		fill_in("username", with: "tester")
		fill_in("password", with: "pass")
		click_button("Log in")
		expect(page).to have_content("Welcome #{user.username}")
	end

	it "redirects to old path" do
		category = FactoryGirl.create(:category)		
		visit category_path(category)
	
		click_link("sign in")
		fill_in("username", with: "tester")
		fill_in("password", with: "pass")
		click_button("Log in")
		expect(current_path).to eq(category_path(category))
	end
end

describe "Signing out" do	
	let(:category) { FactoryGirl.create(:category) }
	let(:user) { FactoryGirl.create(:user)}

	it "doesnt cause error when user isnt logged in" do
		visit signout_path
		expect(current_path).to eq(root_path)
	end

	it "succeeds and redirect to last page" do
		sign_in(username: user.username, password: user.password)
		visit category_path(category)

		click_link("sign out")
		expect(page).to have_content("sign in")
		expect(current_path).to eq(category_path(category))
	end
end
