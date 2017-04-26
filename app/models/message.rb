class Message < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user
	belongs_to :category

	validates :content, presence: true, length: { maximum: 150}
	

	def created_at_formatted
		return created_at.strftime("%H:%M:%S - %d.%m.%y")
	end	

	def quote
		return Message.find_by(id: quote_id)
	end

end
