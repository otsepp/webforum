class Message < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user

end
