class Article < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 3, maximum: 60}
	validates :architect, presence: true, length: {minimum: 3, maximum: 60}
	validates :description, presence: true, length: {minimum: 3, maximum: 200}

end