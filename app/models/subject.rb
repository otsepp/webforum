class Subject < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :messages, dependent: :destroy

	validates :name, presence: true, uniqueness: true

end
