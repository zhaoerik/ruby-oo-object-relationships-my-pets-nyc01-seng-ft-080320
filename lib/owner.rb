require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    "I am a #{@species}."
  end
  
  def self.all
  @@all
  end

  def self.count
    @@all.count 
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.filter do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.filter do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end
 
  def walk_dogs
     self.dogs.filter do |dog|
      dog.mood = "happy"
     end
    end

  def feed_cats
    self.cats.filter do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = self.cats + self.dogs
      pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end


    
end