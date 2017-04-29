require 'rails_helper'
include Helpers

describe "New subject page" do
	let!(:category) { FactoryGirl.create(:category) }
	let(:user) { FactoryGirl.create(:user) }
	
	it "is denied to unsigned user" do
		
	end

	it "is allowed to signed user" do

	end
end
