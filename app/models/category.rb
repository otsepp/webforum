class Category < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :subjects, dependent: :destroy
end
