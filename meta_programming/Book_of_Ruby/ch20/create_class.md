```ruby
# The Book of Ruby - http://www.sapphiresteel.com

puts("What shall we call this class? ")
# make sure class name starts with capital letter
new_class = gets.strip().capitalize() 

# create new class
Object.const_set(new_class, Class.new)

puts("I'll give it a method called 'my_name'" )
class_name = Object.const_get(new_class)

class_name::module_eval{ define_method(:my_name){
  puts("The name of my class is '#{self.class}'" ) }
}
x = class_name.new
x.my_name
```
