class User < ActiveRecord::Base
	
	acts_as_mappable :lat_column_name => :lat, :lng_column_name => :long

	has_secure_password

	 has_many :articles
	 before_save { self.email = email.downcase}
	 VALID_EMAIL_REGEX = /([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})/
	 

	 validates :username, presence: true, 
	 uniqueness: { case_sensitive: false}, 
	 length:{minimum: 3, maximum: 50}

	 
	 validates :email, presence: true, 
	 uniqueness: {case_sensitive: false}, 
	 length:{minimum: 5, maximum: 100}, 
	 format: { with: VALID_EMAIL_REGEX, message: "Enter a valid email address"}


end