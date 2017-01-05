class Article < ActiveRecord::Base

	geocoded_by :title
	after_validation :geocode
		acts_as_mappable :lat_column_name => :latitude,
                   		:lng_column_name => :longitude

	belongs_to :user

	validates :title, presence: true, length: {minimum: 3, maximum: 60}
	validates :description, presence: true, length: {minimum: 3, maximum: 5000}
	validates :user_id, presence: true

	before_save :change_nil_to_default

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
	
	def change_nil_to_default
		if self.latitude == nil
		self.latitude = "55.858325"
		self.longitude = "-4.2884928"	
		end
	end

end
