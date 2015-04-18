class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :title, :description, :price
  validates :price, format: {with: /\A\d+(?:\.\d{0,2})?\z/}

  def average_rating
    self.reviews.map{|review| review.rating}.inject(:+).fdiv(self.reviews.length).round(2)
  end

end
