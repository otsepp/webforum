class Subject < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :messages, dependent: :destroy
 	accepts_nested_attributes_for :messages

	validates :name, presence: true, uniqueness: true
end
