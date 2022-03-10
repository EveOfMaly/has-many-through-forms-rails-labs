class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post


def unique_users_who_commented
  unique_user = []
  @post.comments.each do |comment| 
    if !unique_user.include?(comment.user) 
      unique_user << comment.user
    end
  end
  unique_user
  binding.pry
end
end
