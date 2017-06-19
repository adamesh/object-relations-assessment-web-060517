class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @reviews = []
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find do |customer|
      name == customer.full_name
    end
  end

  def self.find_all_by_first_name(name)
    self.all.select do |customer|
      name == customer.first_name
    end
  end

  def self.all_names
    self.all.map do |customer|
      customer.full_name
    end
  end

  def add_review(restaurant, content)
    new_review = Review.new(restaurant, self, content)
    @reviews << new_review
    new_review
  end

end

class Review
  attr_accessor :restaurant, :customer, :content

  @@all = []

  def initialize(restaurant, customer, content)
    @restaurant = restaurant
    @customer = customer
    @content = content
    @@all << self
    self.restaurant.reviews << self
  end

  def self.all
    @@all
  end

end

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
