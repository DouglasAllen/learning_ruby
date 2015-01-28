```ruby
# from http://www.techotopia.com/index.php/Ruby_Variable_Scope

x = 10
#=> 10

defined? x
#=> "local-variable"

$x = 10
#=> 10

defined? $x
#=> "global-variable"

```