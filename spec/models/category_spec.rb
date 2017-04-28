require 'rails_helper'

RSpec.describe Category, type: :model do

	it "returns last message"do	
		msg1 = FactoryGirl.create(:message)
		msg2 = FactoryGirl.create(:message)
		msg2.subject_id = msg1.subject.id

		category = msg1.category
		expect(category).to eq(msg2.category)
		expect(category.last_message).to eq(msg2.created_at_formatted)
	end

	it "return moderators" do 	
		category = FactoryGirl.create(:category)
		mod1 = FactoryGirl.create(:user)
		mod2 = FactoryGirl.create(:user)
		category.moderators << mod1
		category.moderators << mod2

		expect(category.moderators.size).to eq(2)
		expect(category.moderators).to include(mod1, mod2)
	end

end
