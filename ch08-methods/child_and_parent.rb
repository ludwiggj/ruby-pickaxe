# Sometimes use a splat to specify arguments that are not used by the method but that
# are used by the corresponding method in a superclass. (Note that in this example we
# call super with no parameters. This is a special case that means “invoke this
# method in the superclass, passing it all the parameters that were given to the
# original method.”)

class Parent
  def do_something(*args)
    puts "Parent doing something with #{args}"
  end
end

class Child < Parent
  def do_something(*not_used)
    # our processing
    super
  end
end

# In this case, you can also leave off the name of the parameter and just write an asterisk:
class AnotherChild < Parent
  def do_something(*)
    # our processing
    super
  end
end

Parent.new.do_something "Hi this is the parent"
Child.new.do_something "Yo Dad"
AnotherChild.new.do_something "Yo Mum"
