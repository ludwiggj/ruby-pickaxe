# encoding: ascii-8bit

# String#force_encoding changes the encoding associated with a string but doesn't change the
# byte contents of the string.

str = "\xc3\xa9"             # e-acute in UTF-8
puts str.encoding            # <Encoding:ASCII-8BIT>
puts str                     # é
p str.bytes.to_a             # [195, 169]

str.force_encoding("utf-8")
puts str.encoding            # <Encoding:UTF-8>
puts str                     # é
p str.bytes.to_a             # [195, 169]

# Finally, you can use encode (with two parameters) to convert between two encodings if your
# source string is ASCII-8BIT. This might happen if, for example, you’re reading data in
# binary mode from a file and choose not to encode it at the time you read it. Here we fake
# that out by creating an ASCII-8BIT string that contains an ISO-8859-1 sequence (our old
# friend olé). We then convert the string to UTF-8. To do this, we have to tell encode the
# actual encoding of the bytes by passing it a second parameter:

original = "ol\xe9"          # e-acute in ISO-8859-1
puts original.encoding       # <Encoding:ASCII-8BIT>
p original.bytes.to_a        # [111, 108, 233]

new = original.encode("utf-8", "iso-8859-1")
puts new.encoding            # <Encoding:UTF-8>
p new.bytes.to_a             # [111, 108, 195, 169]
