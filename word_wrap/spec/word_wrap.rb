# Word Wrap Kata - A Cautionary Tail

# Design a __wrap__ function, which takes a string
# and a number for the maximum length of a line

# Return the string, broken up by new lines,
# so that each line is no longer than the max
# length. Prefer to break words on spaces.

#begin
def wrap(string, max_len)
  # return if string fits wrap:
  return string if string.length <= max_len

  # what comes first? A space or the maximum wrap length?
  # store that index. Ignore the newline character as we don't
  # want the wrap registering it as a letter:
  break_index =  string[0..max_len].gsub("\n", " ").rindex(" ") ||
    max_len

  # If we do have a newline
  if string[0..break_index].index("\n")
      # Then we want to restart the break_index count
      # so keep the string up to the newline character,
      # and send the rest of the string to the wrap function:
      string[0..string.index("\n")] +
      wrap(string[string.index("\n")+1..-1], max_len)
  else
    # Otherwise store the string up to the break_index
    # and send the rest through to the wrap function:
    string[0...break_index].strip + "\n" +
    wrap(string[break_index..-1].strip, max_len)
  end

end

puts wrap("An elephant appears. It is big.", 7)

# we want the count to restart if a \n appears
# as the issue is that the wrap function counts the \n character
# in its wrapping, instead it should start a new line.

# notes: do we wrap after or before the break_index? We Wrap
# before the break_index, so we can feed the current break_index
# value into the wrap function again.
