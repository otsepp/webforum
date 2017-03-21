class User < ActiveRecord::Base
	has_many :messages, dependent: :destroy
	has_many :subjects

	validates :username, presence: true, uniqueness: true

	#vain admin ja mod
	def can_edit_and_delete_subject(subject)
		if admin
			return true
		end
		return false
	end

	#admin, mod, ja viestin lähettäjä
	def can_edit_message(message)
		if admin or messages.include? message
			return true
		end
		return false
	end

	#admin ja mod
	def can_delete_message(message)
		if admin
			return true
		end
		return false;
	end	

end
