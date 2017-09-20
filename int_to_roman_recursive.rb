def int_to_roman(i)
  num = ""
  remainder = i
  roman = {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }

  while remainder > 0
    i = translate(remainder, roman)
    num += roman[i]
    remainder -= i
  end
  num
end

def translate(i, roman)
  if roman.key?(i)
    i
  else
    translate(i -= 1, roman)
  end
end

input = gets.chomp!
puts int_to_roman(input.to_i)