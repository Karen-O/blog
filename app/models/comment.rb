class Comment < ActiveRecord::Base
	belongs_to :post
	validates :username, :content, presence: true         ## attributes of Comment class
end