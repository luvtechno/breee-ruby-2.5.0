require 'ripper'

ruby_25 = <<ruby
0.times do
  1
rescue => exception
  2
else
  3
ensure
  4
end
ruby

sexp = Ripper.sexp(ruby_25)
pp sexp
