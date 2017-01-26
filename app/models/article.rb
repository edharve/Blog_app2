class Article < ActiveRecord::Base

	require 'csv'

	
	geocoded_by :address
	after_validation :geocode
		acts_as_mappable :lat_column_name => :latitude,
                   		:lng_column_name => :longitude

	

	validates :title, presence: true, length: {minimum: 3, maximum: 100}
	# validates :description, presence: true, length: {minimum: 3, maximum: 5000}
	# validates :user_id, presence: true

	before_save :change_nil_to_default

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
	

	def change_nil_to_default
		if self.latitude == nil
			self.latitude = "55.858325"
			self.longitude = "-4.2884928"	
		end
	end

	def self.import(file, user)
  		CSV.foreach(file.path, headers: true) do |row|
    		article_hash = row.to_hash
    		article = Article.new(article_hash)
    		article.user = user
    		article.save
  		end
	end

	belongs_to :user

end


