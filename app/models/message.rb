class Message < ActiveRecord::Base

	def get_sender
		return User.find(self.user_id)
	end

end
