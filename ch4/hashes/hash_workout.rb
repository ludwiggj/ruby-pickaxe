h = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }

p h.length # => 3

p h['dog'] # => "canine"
p h['cow'] = 'bovine'
p h[12] = 'dodecine'
p h['cat'] = 99
p h # => {"dog"=>"canine", "cat"=>99, "donkey"=>"asinine", "cow"=>"bovine",
    # .. 12=>"dodecine"}

h = { :dog => 'canine', :cat => 'feline', :donkey => 'asinine' }
p h

# Alternate syntax when keys are symbols
h = { dog: 'canine', cat: 'feline', donkey: 'asinine' }
p h
