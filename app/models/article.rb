class Article < ActiveRecord::Base
	geocoded_by :title
	after_validation :geocode
		acts_as_mappable :lat_column_name => :latitude,
                   		:lng_column_name => :longitude

	belongs_to :user

	validates :title, presence: true, length: {minimum: 3, maximum: 60}
	validates :description, presence: true, length: {minimum: 3, maximum: 5000}
	validates :user_id, presence: true
end