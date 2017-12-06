
require 'rubygems'
require 'bundler/setup'
require 'ruby2ruby'
require 'ruby_parser'

ruby_24 = <<ruby
10.times do
  begin
    puts "foo"
  rescue => exception
    puts "bar"
  else
    puts "baz"
  ensure
    puts "qux"
  end
end
ruby

ruby_25 = <<ruby
10.times do
  puts "foo"
rescue => exception
  puts "bar"
else
  puts "baz"
ensure
  puts "qux"
end
ruby

parser    = RubyParser.new
ruby2ruby = Ruby2Ruby.new

puts "== ruby 2.4.x =="
puts ruby_24

sexp = parser.process(ruby_24)
pp sexp
p ruby2ruby.process(sexp.deep_clone)

puts "\n"

puts "== ruby 2.5.0 =="
puts ruby_25

sexp = parser.process(ruby_25)
pp sexp
p ruby2ruby.process(sexp.deep_clone)
