class Message < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user

	def get_sender
		return User.find(self.user_id)
	end

end
