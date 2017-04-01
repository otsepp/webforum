class Message < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user

	validates :content, presence: true 

	def created_at_formatted
		return created_at.strftime("%H:%M:%S - %d.%m.%y")
	end	

end
