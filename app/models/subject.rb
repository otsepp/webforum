class Subject < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :messages, dependent: :destroy
 	accepts_nested_attributes_for :messages

	validates :name, presence: true, uniqueness: true

	def last_message	
		if !messages.empty?
			return messages.order('created_at desc').first.created_at_formatted
		end
		return nil
	end

	def calculate_page_count
		page_length = 5
		pages = messages.size / page_length
		if !messages.empty? && pages == 0
			pages = 1
		end
		if messages.size > page_length && messages.size % page_length != 0
			pages+=1
		end	
		return pages
	end

end
