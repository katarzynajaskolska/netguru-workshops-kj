class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates_presence_of :rating, :user_id, :content
end
