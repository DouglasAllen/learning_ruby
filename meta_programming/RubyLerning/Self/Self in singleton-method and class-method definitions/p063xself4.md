```ruby
# p063xself4.rb
  
class S  
  def self.x  
    puts "Class method x() of class #{self}"  
    puts self  
  end  
end
  
S.x 

class S  
  def self.show  
    "Class method x() of class #{self}"
  end

  def show
    self
  end  
end

S.show.send :display
S.new.show
```