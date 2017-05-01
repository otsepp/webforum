require 'rails_helper'
include Helpers

describe "Edit user page" do 
	let(:user) { FactoryGirl.create(:user)}

	before :each do 
		sign_in(username: user.username, password: user.password)
		visit edit_user_path(user)
	end

	it "is denied to unauthorized users" do
		click_link("sign out")
		expect(page).to have_content(lacking_right_message)

		another_user = FactoryGirl.create(:user)
		sign_in(username: another_user.username, password: another_user.password)
		visit edit_user_path(user)
		expect(page).to have_content(lacking_right_message)
	end

	it "doesn't show password fields" do
		expect(page).not_to have_css("input", id: "user_password")
		expect(page).not_to have_css("input", id: "user_password_confirmation")
	end

	it "shows signature field" do
		expect(page).to have_css("textarea", id: "user_signature")
	end

	it "succeeds when input is valid" do
		fill_in("user_username", with: "newname")
		fill_in("user_signature", with: "a signature")	
		click_button("Update User")
		expect(current_path).to eq(user_path(user))
		expect(page).to have_content("User was successfully updated.")
	end

	it "doesnt succeed when input is invalid" do
		fill_in("user_username", with: "")
		click_button("Update User")		
		expect(page).to have_content("Username can't be blank")
	end

end

