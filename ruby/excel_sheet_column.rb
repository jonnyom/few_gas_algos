# Problem Statement
#   Write a function that accepts an integer and returns the appropriate Excel Sheet column name
#
# Example
#   Input 1:
#     1
#
#   Output 1:
#     A
#
#   Explanation 1:
#     => 1 corresponds to the first index of the sheet columns i.e A
#
#   Input 2:
#     27
#
#   Output 2:
#     AA
#
#   Explanation 2:
#     => 27 corresponds to the 27th index of the sheet columns i.e AA
#
# Input          Output
#   26               Z
#   51              AY
#   52              AZ
#   80              CB
#  676              YZ
#  702              ZZ
#  705             AAC

ALPHABET = 'A'.upto('Z').to_a.freeze

def excel_sheet_name(index)
  return ALPHABET[index - 1] if index <= 26

  output = ''
  until index.zero?
    modulo_ix = index % ALPHABET.size 
    index /= ALPHABET.size 
    output.insert(0, ALPHABET[modulo_ix - 1])
  end
  output
end

puts(excel_sheet_name(705))
