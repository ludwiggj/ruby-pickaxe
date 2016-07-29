# Characters are simply strings of length one.
# For historical reasons, character constants can be created by preceding the character
# (or sequence that represents a character) with a question mark:

puts ?a        # => "a"
puts ?\n       # => "\n" code for newline, 0x0a
puts ?\C-a     # => "\u0001" (control a) 
puts ?\M-a     # => "\xE1" (meta sets bit 7)
puts ?\M-\C-a  # => "\x81" (meta and control a)
puts ?\C-?     # => "\u007F" (delete character)

# It's far easier to use regular octal and hex escape sequences than to remember these
# ones. Use "a" rather than ?a, and use "\n" rather than ?\n.
