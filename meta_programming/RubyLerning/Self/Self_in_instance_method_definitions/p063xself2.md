```ruby
# p063xself2.rb
  
class S  
  def m  
    puts "Class #{self.class} method #{self.methods.first}:"   
  end  
end
  
s = S.new  
s.m
```