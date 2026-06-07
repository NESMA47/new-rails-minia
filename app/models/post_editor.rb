class Post < ApplicationRecord
  belongs_to :user
  
  has_many :post_editors
  has_many :editors, through: :post_editors
end