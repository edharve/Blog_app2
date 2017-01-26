require 'csv'

desc "Import article from csv file"
task :import => [:environment] do

  file = "db/addresslist.csv"

CSV.foreach(file, headers: true) do |row|
    		article_hash = row.to_hash
    		article = Article.new(article_hash)
    		article.save
    	end
end