# Build the following methods on the customer class
#
# Customer.all
#   should return all of the customers
# Customer.find_by_name(name)
#   given a string of a full name,
#   returns the first customer whose full name matches
# Customer.find_all_by_first_name(name)
#   given a string of a first name,
#   returns an array containing all customers with that first name
# Customer.all_names
#   should return an array of all of the customer full names
# Customer#add_review(restaurant, content)
#   given some content and a restaurant,
#   creates a new review and associates it with that customer and that restaurant

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
