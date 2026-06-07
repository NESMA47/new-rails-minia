class User < ApplicationRecord
  has_many :creator, class_name: 'Post', foreign_key: 'user_id', dependent: :destroy
end