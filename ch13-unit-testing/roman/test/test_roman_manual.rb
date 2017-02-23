require 'roman'

r = Roman.new(1)
fail "'i' expected" unless r.to_s == "i"

r = Roman.new(9)
fail "'ix' expected" unless r.to_s == "ix"

r = Roman.new(8)
fail "'viii' expected" unless r.to_s == "viii"
