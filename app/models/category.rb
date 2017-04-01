class Category < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :subjects, dependent: :destroy
	has_many :messages, through: :subjects

	def last_message	
		
		if !messages.empty?
			t = messages.order('created_at desc').first.created_at

			binding.pry

			return "#{t.hour}:#{t.minute}    #{t.day}.#{t.month}.#{t.year}"
		end
		return nil
	end

end
