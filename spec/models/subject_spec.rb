require 'rails_helper'

RSpec.describe Subject, type: :model do

	it "returns last_message" do
		msg1 = FactoryGirl.create(:message)
		msg2 = FactoryGirl.create(:message)
		msg2.subject_id = msg1.subject_id

		subject = msg1.subject
		expect(subject).to eq(msg2.subject)
		expect(subject.last_message).to eq(msg2.created_at_formatted)
	end

	it "returns page_count" do
		subject = FactoryGirl.create(:subject)
		for i in 1..11
			msg = Message.new(content:"msg")
			subject.messages <<  msg
		end
		expect(subject.calculate_page_count).to eq(3)
	end

end
