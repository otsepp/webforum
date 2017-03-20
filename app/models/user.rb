class User < ActiveRecord::Base
	has_many :messages, dependent: :destroy
	
	#has_many :subjects

	validates :username, presence: true, uniqueness: true

	#placeholder
	def has_modify_rights_to_subject(subject)
		return true
	end

	#placeholder
	def has_modify_rights_to_message(message)
		return true
	end

end
