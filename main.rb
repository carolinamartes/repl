require 'eval_in'

language=[
"ruby/mri-2.1",
"c/gcc-4.9.1",
"c++/gcc-4.9.1",
"coffeescript/node-0.10.29-coffee-1.7.1",
"fortran/f95-4.4.3",
"	haskell/hugs98-sep-2006",
"io/io-20131204",
"javascript/node-0.10.29",
"lua/lua-5.2.3",
"ocaml/ocaml-4.01.0",
"	php/php-5.5.14",
"pascal/fpc-2.6.4",
"perl/perl-5.20.0",
"python/cpython-3.4.1",
"slash/slash-head",
"assembly/nasm-2.07"
]

result = EvalIn.call 'puts "hello, #{gets}"', stdin: 'world', language: "ruby/mri-2.1"

puts result.output
