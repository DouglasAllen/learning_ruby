```ruby
# from http://www.ruby-doc.org/core-2.2.0/Binding.html

#
class Demo
  def initialize(n)
    @secret = n
  end

  def get_binding
    binding
  end
end

k1 = Demo.new(99)
b1 = k1.get_binding
k2 = Demo.new(-3)
b2 = k2.get_binding

p eval('@secret', b1)   #=> 99
p eval('@secret', b2)   #=> -3
p eval('@secret')       #=> nil

def foo
  a = 1
  p binding.local_variable_defined?(:a) #=> true
  p binding.local_variable_defined?(:b) #=> false
end

foo

def foo
  a = 1
  p binding.local_variable_get(:a) #=> 1
  # p binding.local_variable_get(:b) #=> NameError
end

foo

def foo
  a = 1
  b = binding
  b.local_variable_set(:a, 2) # set existing local variable `a'
  b.local_variable_set(:b, 3) # create new local variable `b'
  # `b' exists only in binding.
  c = binding
  p c.local_variable_get(:a) #=> 2
  p c.local_variable_get(:b) #=> 3
  p a #=> 2
  # p b #=> NameError
end

foo

def foo
  a = 1
  2.times do |_n|
    p binding.local_variables #=> [:a, :n]
  end
end

foo

```