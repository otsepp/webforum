FactoryGirl.define do

	sequence :category_name do |n| 
		"category name #{n}"
	end
	
	factory :category do 
		name { generate(:category_name) }
	end


	sequence :subject_name do |n| 
		"subject #{n}"
	end

	factory :subject do 
		name { generate(:subject_name) }
		category
		user
	end


	factory :message do 
		content "message"
		subject
		user
	end


	sequence :username do |n| 
		"user #{n}"
	end

	factory :user do 
		username { generate(:username) }
		password "pass"
		password_confirmation "pass"
	end

end
