class Post < ActiveRecord::Base
	extend FriendlyId
	belongs_to :user
	has_many :comment
	# validates_associated :comments
    validates :title, presence:true,length: {maximum:100,minimum:2},uniqueness:true
    validates :content,presence:true
    paginates_per 5
    friendly_id :title, use: [:slugged]
    
end
