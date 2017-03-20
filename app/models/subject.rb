class Subject < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	belongs_to :category
	has_many :messages, dependent: :destroy
end
