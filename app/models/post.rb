class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates_associated :comments
    validates :title, presence:true,length: {maximum:100},uniqueness:true
    validates :content,length:{minimum:3}
    paginates_per 5
    
end
