class Category < ActiveRecord::Base
	has_many :subjects, dependent: :destroy
	has_many :messages, through: :subjects, dependent: :destroy

	has_many :moderators, class_name: "User", foreign_key: "moderator_category_id"

	validates :name, presence: true, uniqueness: true, length: { maximum: 20 }

	def last_message	
		if !messages.empty?
			return messages.order('created_at desc').first.created_at_formatted
		end
		return nil
	end

end
