class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates_associated :comments
    validates :title, presence:true,length: {maximum:100,minimum:2},uniqueness:true
    validates :content,presence:true
    paginates_per 5
    
    
end
