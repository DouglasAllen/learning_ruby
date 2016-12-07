```ruby
# The Book of Ruby - http://www.sapphiresteel.com

#
class MyClass
  def initialize
    @aVar = 'Hello world'
  end

  def show_ivars
    p instance_eval { @aVar }
  end
end

ob = MyClass.new
p(ob.instance_eval { @aVar })			#=> "Hello world"
p(ob.instance_eval('@aVar'))		#=> "Hello world"
# p( ob.eval( "@aVar" )  )			#=> error: eval is a private method
ob.show_ivars

# make eval public to Object.
class Object
  public :eval					#=> Try commenting this out!
end

p(ob.eval('@aVar'))				#=> "Hello world"

```