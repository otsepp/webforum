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
		
	end

end
