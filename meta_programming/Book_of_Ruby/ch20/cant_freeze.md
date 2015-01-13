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

# freeze doesn't prevent new method definitions but
# frozen? can be used as a test before doing so!
ob = X.new
ob.instance_variable_set("@a_name", "Bert")
ob.add_method( :xyz ) { puts("My name is #{@a_name}") }
ob.xyz

ob.freeze # try commenting this out
ob.add_method( :abc ) { puts("This is the abc method") }
ob.abc

if not( ob.frozen? ) then
  ob.add_method( :def ) { puts("'def' is not a good name for a method") }
end

ob.def # def wasn't added so this will cause an error
```
