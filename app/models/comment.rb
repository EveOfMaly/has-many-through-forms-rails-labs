class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user


  def user_attributes=(user_attributes)

    binding.pry
  end

end


# <ul>
# <% @post.unique_users_who_commented.each do |user| %>
#    <li> <%=  link_to user.username, user_path(user.id) %></li>
#   <% end  %>
#  </ui> 
# <br>
