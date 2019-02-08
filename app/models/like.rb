#https://stackoverflow.com/questions/7428872/rails-validate-unique-combination-of-3-columns
class Like < ApplicationRecord
	belongs_to :likeable, polymorphic: true
	belongs_to :user
	validates_uniqueness_of :user_id, scope: [:likeable_type, :likeable_id]
end
