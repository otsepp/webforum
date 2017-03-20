class Subject < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	belongs_to :category
	has_many :messages, dependent: :destroy

	#lisää col creator_id

end
