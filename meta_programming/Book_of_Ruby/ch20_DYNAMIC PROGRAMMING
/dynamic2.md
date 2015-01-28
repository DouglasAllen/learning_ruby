```ruby
# The Book of Ruby - http://www.sapphiresteel.com

class X
  def y
    puts( "y_method" )
  end
end

print( "Enter a class name: ")
cname = gets().chomp
ob = Object.const_get(cname).new
p( ob )
print( "Enter a method to be called: " )
m_name = gets().chomp
ob.method(m_name).call
```
