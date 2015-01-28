```ruby
# from http://www.devalot.com/articles/2008/09/ruby-singleton

foobar = Array.new
foobar.class # => Array
foobar.size  # => 0

foobar = Array.new

def foobar.size
  "Hello World!"
end

foobar.size  # => "Hello World!"
foobar.class # => Array

bizbat = Array.new
bizbat.size  # => 0



foobar = []

class << foobar
  def foo
    "Hello World!"
  end
end

foobar.singleton_methods # => ["foo"]

foobar = []

foobar.instance_eval <<EOT
  def foo
    "Hello World!"
  end
EOT
  
foobar.singleton_methods # => ["foo"]

class Foo
  
  def self.one () 1 end
  
  class << self
    def two () 2 end
  end

  def three () 3 end
  
  self.singleton_methods # => ["two", "one"]
  self.class             # => Class
  self                   # => Foo
end

require 'test/unit'

class Foo
  
  def available?
    status == 1
  end
  
  private
  
  def status
    rand(1)
  end
end

class FooTest < Test::Unit::TestCase
  def setup
    @foo = Foo.new
  end

  def test_available_with_status_1
    def @foo.status () 1 end
    assert(@foo.available?)
  end
  
  def test_available_with_status_0
    def @foo.status () 0 end
    assert(!@foo.available?)
  end
end

module Foo
  def foo
    "Hello World!"
  end
end

foobar = []
foobar.extend(Foo)
foobar.singleton_methods # => ["foo"]
```