
require 'rubygems'
require 'bundler/setup'
require 'ruby2ruby'
require 'ruby_parser'
require 'ripper'
require 'pry'

def breee_body?(sexp)
  raise "Unexpected s-expression: #{sexp}" unless sexp[0] == :bodystmt

  sexp[1..-1].compact.any? do |sub_sexp|
    sub_sexp[0] == :rescue || sub_sexp[0] == :else || sub_sexp[0] == :ensure
  end
end

def find_breee_line(sexp)
  raise "Unexpected s-expression: #{sexp}" unless sexp[0] == :bodystmt

  (sexp.flatten.find { |e| e.is_a?(Integer) }) - 1
end

def find_breee(sexp)
  case sexp
  when nil, Symbol, String, Numeric
    []
  when Array
    if sexp[0] == :begin && breee_body?(sexp[1])
      line = find_breee_line(sexp[1])
    end

    [line, *sexp.map { |sub_sexp| find_breee(sub_sexp) }].compact.flatten
  else
    raise "Unexpected s-expression: #{sexp}"
  end
end

ruby_24 = <<ruby
0.times do
  begin
    1
  rescue => exception
    2
  else
    begin
      3.1
    ensure
      3.2
    end
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

puts "breee lines: #{find_breee(sexp)}"

binding.pry

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
