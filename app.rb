require 'rubygems'
require 'sinatra'

set :protection, :except => :frame_options

Languages = [
  ['Javascript', 'javascript/node-0.10.29'],
  ['C', 'c/gcc-4.9.1'],
  ['C++', 'c++/gcc-4.9.1'],
  ['Coffeescript', 'coffeescript/node-0.10.29-coffee-1.7.1'],
  ['Fortran', 'fortran/f95-4.4.3'],
  ['Haskell', 'haskell/hugs98-sep-2006'],
  ['Io', 'io/io-20131204'],
  ['Ruby', 'ruby/mri-2.1'],
  ['Lua', 'lua/lua-5.2.3'],
  ['oCaml', 'ocaml/ocaml-4.01.0'],
  ['PHP', 'php/php-5.5.14'],
  ['Pascal', 'pascal/fpc-2.6.4'],
  ['Perl', 'perl/perl-5.20.0'],
  ['Python', 'python/cpython-3.4.1'],
  ['Slash', 'slash/slash-head'],
  ['Assembly', 'assembly/nasm-2.07'],
]

get '/' do
    erb :index
end

get '/iframe' do
  erb :iframe
end
