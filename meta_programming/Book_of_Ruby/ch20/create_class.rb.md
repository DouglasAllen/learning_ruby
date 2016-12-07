```ruby
# The Book of Ruby - http://www.sapphiresteel.com

puts('What shall we call this class? ')
# make sure class name starts with capital letter
className = gets.strip.capitalize
Object.const_set(className, Class.new)		# create new class
puts("I'll give it a method called 'myname'")
className = Object.const_get(className)
className.module_eval do
  define_method(:myname)do
    puts("The name of my class is '#{self.class}'")
  end
end
x = className.new
x.myname

```