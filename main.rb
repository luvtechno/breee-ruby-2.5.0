
require 'rubygems'
require 'bundler/setup'
require 'ruby2ruby'
require 'ruby_parser'
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

parser    = RubyParser.new
ruby2ruby = Ruby2Ruby.new

puts "== ruby 2.4.x =="

puts ruby_24
puts "\n"

eval(ruby_24)
puts "\n"

sexp = Ripper.sexp(ruby_24)
pp sexp
# sexp = parser.process(ruby_24)
# pp sexp
# p ruby2ruby.process(sexp.deep_clone)
puts "\n"

puts "== ruby 2.5.0 =="

puts ruby_25
puts "\n"

eval(ruby_25)
puts "\n"

sexp = Ripper.sexp(ruby_25)
pp sexp
# sexp = parser.process(ruby_25)
# pp sexp
# p ruby2ruby.process(sexp.deep_clone)
puts "\n"
