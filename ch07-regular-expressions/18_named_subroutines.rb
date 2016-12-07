# Named Subroutines

# There's a trick that allows us to write subroutines inside regular expressions.

# A named group is referenced using \g<name>, and the group defined using (?<name>...).

# Normally, the definition of the group is itself matched as part of executing the pattern.
# However, if the suffix {0} is added to the group, it means zero matches of this group, so
# the group is not executed when first encountered:

sentence = %r{
  (?<subject>   cat   | dog   | gerbil    ){0}
  (?<verb>      eats  | drinks| generates ){0}
  (?<object>    water | bones | PDFs      ){0}
  (?<adjective> big   | small | smelly    ){0}
  (?<opt_adj>   (\g<adjective>\s)?        ){0} 

  The\s\g<opt_adj>\g<subject>\s\g<verb>\s\g<opt_adj>\g<object>
}x

p md = sentence.match("The cat drinks water")
puts "The subject is #{md[:subject]} and the verb is #{md[:verb]}"

p md = sentence.match("The big dog eats smelly bones")
puts "The last adjective in the second sentence is #{md[:adjective]}"

p sentence =~ "The gerbil generates big PDFs"
puts "And the object in the last sentence is #{$~[:object]}"
