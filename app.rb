require 'sinatra'
require 'dotenv'
Dotenv.load
require 'rubygems'
require 'bundler'
require 'eval_in'
require 'pry'



set :protection, :except => :frame_options

class App < Sinatra::Base

Languages = [
  ['Javascript', 'javascript/node-0.10.29', "console.log('Hello World!');"],
  ['C', 'c/gcc-4.9.1', '#include <stdio.h>
    int main() {printf("Hello World!");}'],
  ['C++', 'c++/gcc-4.9.1', '#include <iostream>
    int main(){std::cout << "Hello World!\n";}'],
  ['Coffeescript', 'coffeescript/node-0.10.29-coffee-1.7.1', "console.log 'Hello World!'"],
  ['Fortran', 'fortran/f95-4.4.3', "Program Hello
    Print *, 'Hello World!'
    End Program Hello"],
  ['Haskell', 'haskell/hugs98-sep-2006', 'main = putStrLn "Hello World!"'],
  ['Io', 'io/io-20131204', 'write("Hello World!\n")'],
  ['Ruby', 'ruby/mri-2.1', "puts 'Hello World!'"],
  ['Lua', 'lua/lua-5.2.3', "print('Hello World!')"],
  ['oCaml', 'ocaml/ocaml-4.01.0', 'print_endline "Hello World!";'],
  ['PHP', 'php/php-5.5.14', "<?php echo 'Hello World!';?>"],
  ['Pascal', 'pascal/fpc-2.6.4', "program HelloWorld; begin WriteLn('Hello World!'); end."],
  ['Perl', 'perl/perl-5.20.0', 'print "Hello World!";'],
  ['Python', 'python/cpython-3.4.1', 'print ("Hello World!")'],
  ['Slash', 'slash/slash-head', 'Hello World!']
  # ['Assembly', 'assembly/nasm-2.07', "dosseg .model small.stack 100h .data hello_message db 'Hello, World!',0dh,0ah,'$' .code  main  proc mov ax,@data
  #   mov ds,ax mov ah,9 mov dx,offset hello_message int 21h mov ax,4C00h int 21h main  endp  end main"]
]

get '/' do
    @result
    @language=@language.to_s
    @code
    erb :index
end


post '/' do

  @language = params[:languages]
  @example=params[:example]

  if @language !='javascript/node-0.10.29' && @example!="true"
    @code= params[:code]
    result = EvalIn.call @code, language: "#{@language}"
    return @result= [result.output]
  end

    if @example=="true"
      for lan in Languages
        if @language==lan[1]
          hello_world=lan[2]
        end
      end
    return @result= [hello_world]
    end

  # erb :index

end

get '/iframe' do
  erb :iframe
end
end
