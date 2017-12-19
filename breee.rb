# require 'rubygems'
# require 'bundler/setup'
require 'ripper'


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
  when nil, Symbol, String, Numeric, TrueClass, FalseClass
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



# file_names = Dir.glob('../../wantedly/wantedly/**/*.rb')[0..100]
file_names = Dir.glob('**/*.rb')[0..100]
file_names.each do |file_name|
  f = File.open(file_name)
  sexp = Ripper.sexp(f)
  line_nums = find_breee(sexp)
  line_nums.each do |line_num|
    puts "https://github.com/wantedly/wantedly/blob/master/#{file_name}#L#{line_num}"
  end
end

