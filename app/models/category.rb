class Category < ActiveRecord::Base
	has_many :subjects, dependent: :destroy
	has_many :messages, through: :subjects, dependent: :destroy

	validates :name, presence: true, uniqueness: true

	def last_message	
		if !messages.empty?
			t = messages.order('created_at desc').first.created_at
			return t.strftime("%H:%M:%S - %d.%m.%y")
		end
		return nil
	end

end
