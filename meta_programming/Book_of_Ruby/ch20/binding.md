```ruby
# The Book of Ruby - http://www.sapphiresteel.com

# This example taken from the Ruby class library documentation
def get_binding(str)
  return binding()
end

str = "hello"
puts( eval( "str + ' Fred'" ) ) #=> "hello Fred"
puts( eval( "str + ' Fred'", get_binding("bye") ) ) #=> "bye Fred"

# for irb session
eval "str + ' Fred'"
eval "str + ' Fred'", get_binding("bye")
```
