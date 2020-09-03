class Idea < ApplicationRecord
	validates :description, presence: true
	validates :author, presence: true
end
