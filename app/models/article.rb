class Article < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 3, maximum: 60}
	validates :description, presence: true, length: {minimum: 3, maximum: 200}
		# geocoded_by :title, latitude: :lat, longitude: :lon
		# 	after_validation :geocode, if: ->(obj){obj.title.present? and obj.title_changed? }
end