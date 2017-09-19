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


  def translate_upto(i)
    ary = []
    @num = ""
    if @roman.key?(i)
      i < 10 ? @num = upto_nine(i) : @num = @roman[i]
    elsif i >= 40
      @num = upto_fifty(i)
    elsif i >= 10
      @num = upto_forty(i)
    elsif i < 10
      @num = upto_nine(i)
    end
    @num
  end

  #def upto_ninety(i)
    #@roman[50] + 
  #end

  def upto_fifty(i)
    @roman[40] + upto_nine(i.digits.first)
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
int = 40
ary = []

(1..int).each do |i|
  ary << trans.translate_upto(i)
end

print ary