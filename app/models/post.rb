class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attribute)
    category_attribute.values.each do |category_attribute|
      if category_attribute["name"].present?
       category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end

  def unique_users
    user_list = []

    self.users.each do |user| 
      if !user_list.include?(user)
       user_list << user 
      end
    end
    user_list
  end
end
