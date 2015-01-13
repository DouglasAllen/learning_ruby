```ruby

http://ruby-doc.org/docs/keywords/1.9/Object.html#method-i-self

http://yehudakatz.com/2009/11/15/metaprogramming-in-ruby-its-all-about-the-self/

http://rubylearning.com/satishtalim/ruby_self.html

https://github.com/DouglasAllen/learning_ruby/blob/master/meta_programming/Prag_Book/Part_I_Metaprogramming_Ruby/ch01_Monday_The_Object_Model/Self/top_level_self.md

https://github.com/DouglasAllen/learning_ruby/blob/master/meta_programming/Prag_Book/Part_I_Metaprogramming_Ruby/ch01_Monday_The_Object_Model/Self/Self_inside_class_and_module_definitions/p063xself1.md

https://github.com/DouglasAllen/learning_ruby/blob/master/meta_programming/Prag_Book/Part_I_Metaprogramming_Ruby/ch01_Monday_The_Object_Model/Self/Self_in_instance_method_definitions/p063xself2.md

https://github.com/DouglasAllen/learning_ruby/blob/master/meta_programming/Prag_Book/Part_I_Metaprogramming_Ruby/ch01_Monday_The_Object_Model/Self/Self%20in%20singleton-method%20and%20class-method%20definitions/p063xself3.md

https://github.com/DouglasAllen/learning_ruby/blob/master/meta_programming/Prag_Book/Part_I_Metaprogramming_Ruby/ch01_Monday_The_Object_Model/Self/Self%20in%20singleton-method%20and%20class-method%20definitions/p063xself4.md

# my irb session

s = TOPLEVEL_BINDING.methods - Object.methods
irb s
self
#=> [:eval, :local_variables, :local_variable_get, :local_variable_set, :local_variable_defined?, :receiver]

self[5].send :display
#=> receiver    nil

exit
#=> #<IRB::Irb: @context=#<IRB::Context:0xb812cdd0>, @signal_status=:IN_EVAL, @scanner=#<RubyLex:0xb813f750>>

class << self
  self.ancestors
end
#=> [#<Class:#<Object:0xb7c82e38>>, IRB::ExtendCommandBundle, Object, Kernel, BasicObject]

class << self
  self.superclass
end
#=> Object

class << self
  self.instance_methods(false).sort
end
#=> [:bindings, :cb, :chws, :conf, :context, :cws, :cwws, :exit, :fg, :help, :inspect, 
     :irb_bindings, 
     :irb_cb, 
     :irb_change_binding, 
     :irb_chws, 
     :irb_current_working_binding, 
     :irb_cwb, 
     :irb_cws, 
     :irb_cwws, 
     :irb_pop_binding, 
     :irb_popb, 
     :irb_popws, 
     :irb_print_working_binding, 
     :irb_print_working_workspace, 
     :irb_push_binding, 
     :irb_pushb, 
     :irb_pushws, 
     :irb_pwb, 
     :irb_pwws, 
     :irb_quit, 
     :jobs, :kill, 
     :popb, :popws, 
     :pushb, :pushws, 
     :pwws, :quit, :source, :to_s, :workspaces]
  
irb Object
self
#=> Object

self.instance_methods(false).sort
#=> []

obj = self.new
#=> #<Object:0xb7c62bd8>

exit

class << self
  p self.send :help 
end
```