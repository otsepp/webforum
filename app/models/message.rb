class Message < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user

	validates :content, presence: true
	validates_length_of :content, :maximum => 500, :too_long => "Message is too long (max 500 words)", :tokenizer => lambda {|str| str.scan(/\w+/) }

	validates :subject_id, presence: true

	def created_at_formatted
		return created_at.strftime("%H:%M:%S - %d.%m.%y")
	end	

	def quote
		return Message.find_by(id: quote_id)
	end

	def category
		return subject.category
	end

end
