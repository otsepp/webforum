require 'rails_helper'
include Helpers

describe "Categories page" do

		it "should not have 'new category'-link if user is not logged in or is not admin" do 
			visit categories_path
			expect(page).not_to have_content("new category")

			user = FactoryGirl.create(:user)
			sign_in(username: user.username, password: user.password)

			expect(page).not_to have_content("new category")
		end

		it "should have 'new category'-link if user is admin" do 
			user = FactoryGirl.create(:user, admin: true)
			sign_in(username: user.username, password: user.password)
			expect(page).to have_content("new category")
		end

		
		
end
