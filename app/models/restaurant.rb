# Restaurant.all
#   returns an array of all restaurants
# Restaurant.find_by_name(name)
#   given a string of restaurant name, returns the first restaurant that matches
# Restaurant#reviews
#   returns an array of all reviews for that restaurant
# Restaurant#customers
#   should return all of the customers who have written reviews of that restaurant.

class Restaurant
  attr_accessor :name, :reviews

  @@all = []

  def initialize(name)
    @name = name
    @reviews = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|restaurant| name == restaurant.name}
  end

  def customers
    self.reviews.map do |review|
      review.customer
    end
  end

end
