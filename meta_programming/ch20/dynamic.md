```ruby
# The Book of Ruby - http://www.sapphiresteel.com

class X
  def a
    puts("method a")
  end
  
  def add_method( m, &block )
    self.class.send( :define_method, m , &block )
  end
end

ob = X.new
ob.instance_variable_set("@a_name", "Bert")
ob.add_method( :xyz ) { puts("My name is #{@a_name}") }
ob.xyz
ob2 = X.new
ob2.instance_variable_set("@a_name", "Mary")
ob2.xyz
puts( ob2.instance_variable_get( :@a_name ) )
X::const_set( :NUM, 500 )
puts( X::const_get( :NUM ) )
```
