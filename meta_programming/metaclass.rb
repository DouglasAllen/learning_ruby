file =<<'HERE'

In Ruby everything is an object, even Class (sort of, see reference).
Every object also has at least one meta-object lurking behind it.
The meta-object serves as an easy way to intercept singleton-method overrides for the object.

A method is first looked up in the object’s metaclass, then the object’s parent class, then to parent class’ metaclass than to parent class’s parent class, and so on…
Note that meta-object is also an object, so itself can also contain an meta-object: the meta-meta-object.

Here is a set of useful methods when doing metaporgramming: code by _why
HERE
puts file

class Object
  # The hidden singleton lurks behind everyone
  def metaclass; class << self; self; end; end
  def meta_eval &blk; metaclass.instance_eval &blk; end

  # Adds methods to a metaclass
  def meta_def( name, &blk )
    meta_eval { define_method name, &blk }
  end

  # Defines an instance method within a class
  def class_def( name, &blk )
    class_eval { define_method name, &blk }
  end
end
