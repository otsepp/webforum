class Subject < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :messages, dependent: :destroy
 	accepts_nested_attributes_for :messages

	validates :name, presence: true, uniqueness: true, length: { maximum: 50}
	validates :category_id, :user_id, presence: true


	def last_message	
		return messages.order('created_at desc').first.created_at_formatted
	end

	def calculate_page_count
		pages = messages.size / page_length
		if !messages.empty? && pages == 0
			pages = 1
		end
		if messages.size > page_length && messages.size % page_length != 0
			pages+=1
		end	
		return pages
	end
	
	def page_length 
		return 5
	end

end
