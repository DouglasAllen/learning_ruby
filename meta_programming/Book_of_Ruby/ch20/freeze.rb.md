```ruby
# The Book of Ruby - http://www.sapphiresteel.com

a = [1, 2, 3]
a.freeze
unless a.frozen?
  a << [4, 5, 6]
end

p(a)

s = 'Hello'
s << ' world'
s.freeze
s << ' !!!' # Error: "can't modify frozen string (TypeError)"

```