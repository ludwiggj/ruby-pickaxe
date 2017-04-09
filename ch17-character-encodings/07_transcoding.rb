# encoding: utf-8
ole_in_utf = "olé"
puts ole_in_utf.encoding                           # => #<Encoding:UTF-8>
puts ole_in_utf.bytes.to_a                         # => [111, 108, 195, 169]
ole_in_8859 = ole_in_utf.encode("iso-8859-1")
puts ole_in_8859.encoding                          # => #<Encoding:ISO-8859-1>
puts ole_in_8859.bytes.to_a                        # => [111, 108, 233]

# if the target encoding doesn’t contain characters that appear in your source string,
# Ruby will throw an exception. For example, the π character is available in UTF-8 but
# not in ISO-8859-1:
pi = "pi = π"
# pi.encode("iso-8859-1") # U+03C0 from UTF-8 to ISO-8859-1 (Encoding::UndefinedConversionError)

# You can, however, override this behavior, for example supplying a placeholder character to
# use when no direct translation is possible.

puts pi.encode("iso-8859-1", :undef => :replace, :replace => "??") # pi = ??

# String#force_encoding changes the encoding associated with a string but doesn't change the
# byte contents of the string.
