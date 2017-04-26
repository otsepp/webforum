class User < ActiveRecord::Base
	has_many :messages
	has_many :subjects
	belongs_to :moderator_category, class_name: "Category"

	validates :username, :password, presence: true, uniqueness: true, length: { maximum: 30}

	has_secure_password

	#vain admin ja mod
	def can_edit_and_delete_subject(subject)
		if admin or moderator(subject.category)
			return true
		end
		return false
	end

	#admin, mod, ja viestin lähettäjä
	def can_edit_message(message)
		if admin or moderator(message.category) or creator(message)
			return true
		end
		return false
	end

	#admin ja mod
	def can_delete_message(message)
		if admin or moderator(message.category)
			return true
		end
		return false;
	end	

	private
	def moderator(category)
		if moderator_category == category
			return true
		end
		return false
	end

	private
	def creator(message) 
		if id == message.user.id
			return true
		end
		return false
	end

end
