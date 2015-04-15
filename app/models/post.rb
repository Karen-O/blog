class Post < ActiveRecord::Base    # Sets up class Post to inherit from ActiveRecord Base-- aka, it inherits all the methods available in the ActiveRecord Base class
	has_many :comments
	# has_many :taggings
	# has_many :tags, through: :taggings   ## hash! (key-value pair)
	validates :title, :content, presence: true             ## 2 attributes (so far!) of Post class; + presence:true as Rails/AR "version" of 'NOT NULL'
end