class Article < ActiveRecord::Base
	geocoded_by :title
	after_validation :geocode
	acts_as_mappable

	belongs_to :user

	validates :title, presence: true, length: {minimum: 3, maximum: 60}
	validates :description, presence: true, length: {minimum: 3, maximum: 5000}
	validates :user_id, presence: true
end