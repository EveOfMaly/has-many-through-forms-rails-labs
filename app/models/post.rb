class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories


  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
        if !category_attribute[:name].empty? 
          category = Category.find_or_create_by(category_attribute)
          self.categories << category
        end
    end
  end

  def unique_users_who_commented
    unique_user = []

    self.comments.each do |comment| 
      if !unique_user.include?(comment.user) 
        unique_user << comment.user
      end
    end
  
    unique_user
  end

end
