require_relative 'observer_impl'

class Animal
  def initialize(call)
    @call = call
  end

  def update
    puts @call
  end
end

class Zoo
  include Observable

  def initialize
    add_observer(Animal.new("moo"))
    add_observer(Animal.new("baa"))
  end

end

zoo = Zoo.new

zoo.notify_observers
