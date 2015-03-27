=begin
Metaprogramming Patterns

Dynamically Defined Methods

One useful pattern in Ruby metaprogramming is the use of dynamically generated methods.
Combined with metaclass, Moduel#define_method enables us to generate customized methods for the subclasses
of a given class:
=end
class MetaFactory
  def self.build *names
    names.each do |name|
      meta_def "build_me_a_#{name}" do # these methods will only defined in the class that calls build()
        "Here's a #{name}"   # You can do more here
      end
    end
  end
end

class Factory < MetaFactory
  build :foo, :bar, :baz    # build_me_a_foo, build_me_a_bar, build_me_a_baz; only defined in Factory
end

Factory.build_me_a_foo      # => "You've got a foo", this only exist in Factory class

Factory.metaclass.instance_methods.grep /foo/  # => ["build_me_a_foo"]
Factory.public_methods.grep /foo/              # => ["build_me_a_foo"]
Factory.public_methods.sort == Factory.metaclass.instance_methods.sort # => true

# singleton_methods contains methods that has been injected into metaclass
Factory.singleton_methods                      # => [..., "build", "build_me_a_foo"]

# dynamically defined class method is not in parent class
MetaFactory.build_me_a_foo                     # => NoMethodError
# Note also meta_def is just a syntactical sugar to provide better code readability.
# You can achieve the same effect by using Object#instance_eval on metaclass or Object#instance_eval on self:

class MetaFactory
  def self.build *names
    names.each do |name|
      source_code = %Q{
          def build_me_a_#{name}
            "Here's a #{name}"
          end}
      instance_eval source_code   # implicit self => Subclass Factory (class method)
    end
  end
end

class Factory < MetaFactory; build :foo; end

Factory.build_me_a_foo                         # => "You've got a foo".
Factory.metaclass.instance_methods.grep /foo/  # => ["build_me_a_foo"]
Factory.singleton_methods                      # => [..., "build", "build_me_a_foo"]
The above build method is not able to use Module#define_method because define_method is only used for defining instance methods, when called within the class context. So, the only way to use a define_method to define a class method is in the metaclass context.
For various ways to define a class method in Ruby see Jay Field’s “Ruby: Defining Class Methods”.

#  http://reference.jumpingmonkey.org/programming_languages/ruby/ruby-metaprogramming.html#h2
