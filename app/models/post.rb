class Post < ApplicationRecord
  def self.deliver(id, title, text)
  	puts "delivering...."
  	sleep 20
  	Post.find(id).update_attributes(title: title, text: text)
  	puts "FINISHED"
  end
end
