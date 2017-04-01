class Subject < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :messages, dependent: :destroy
 	accepts_nested_attributes_for :messages

	validates :name, presence: true, uniqueness: true

	def last_message	
		if !messages.empty?
			
			t = messages.order('created_at desc').first.created_at
			return t.strftime("%H:%M:%S - %d.%m.%y")
		end
		return nil
	end

end
