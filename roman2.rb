public

class Translator

  def initialize
    @num = ""
    @ones = ""
    @roman = {
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
  end


  def translate_upto(int)
    ary = []
    @num = ""
    (1..int).each do |i|
      @num = ""
      if i >= 10
        @num = upto_forty(i)
      elsif i < 10
        @num = upto_nine(i)
      end
      ary << @num
    end
    ary
  end

  def upto_forty(i)
    tens = ("X" * (i / 10))
    if i.digits.first == 0
      tens   
    else
      ones = upto_nine(i.digits.first)
      tens + ones
    end
  end

  def upto_nine(i)
    if @roman.key?(i)
      @ones = @roman[i]
    else
      @ones += "I"
    end
  end
end

trans = Translator.new
ary = trans.translate_upto(39)

print ary