require 'rails_helper'
include Helpers

describe "Signing up" do
	before :each do
		visit signup_path
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

end

describe "Signing out" do

end
