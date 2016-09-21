require 'eval_in'




result = EvalIn.call 'puts "hello, #{gets}"', stdin: 'world', language: "ruby/mri-2.1"

puts result.output
