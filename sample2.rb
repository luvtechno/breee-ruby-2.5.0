require 'ripper'

ruby_24 = <<ruby
0.times do
  begin
    1
  rescue => exception
    2
  else
    3
  ensure
    4
  end
end
ruby

sexp = Ripper.sexp(ruby_24)
pp sexp
