```ruby
#!/usr/bin/env ruby

class Meta
  %w{ jane elizabeth mary kitty lydia }.each do |n|
    define_method(n) { puts "My name is #{n.capitalize} Bennet." } 
  end
end

Meta.instance_methods - Object.instance_methods #  => ["jane", "elizabeth", "mary", "kitty", "lydia"]

meta = Meta.new

meta.elizabeth # => My name is Elizabeth Bennet.
```