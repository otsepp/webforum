class User < ActiveRecord::Base
	has_many :messages, dependent: :destroy
	validates :username, presence: true, uniqueness: true
end
