```ruby
# The Book of Ruby - http://www.sapphiresteel.com

module X
end

class Y
  @@x = 10
  include X
end

ob = Y.new

X::module_eval{ define_method(:xyz){ puts("hello" ) } }
ob.xyz

Y::class_eval{ define_method(:abc){ puts("hello, hello" ) } }
ob.abc

X::class_eval{ define_method(:xyz2){ puts("hello again" ) } }
ob.xyz2

Y::module_eval{ define_method(:abc2){ puts("hello, hello again" ) } }
ob.abc2

String::class_eval{ define_method(:bye){ puts("goodbye" ) } }
"Hello".bye

p( Y.class_eval( "@@x" ) ) 
```
