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
    elsif i >= 900
      @num = upto_one_thousand(i)
    elsif i >= 500
      @num = upto_nine_hundred(i)
    elsif i >= 100
      @num = upto_five_hundred(i)
    elsif i >= 90
      @num = upto_one_hundred(i)
    elsif i >= 50
      @num = upto_ninety(i)
    elsif i >= 40
      @num = upto_fifty(i)
    elsif i >= 10
      @num = upto_forty(i)
    elsif i < 10
      @num = upto_nine(i)
    end
    @ones = ""
    @num
  end

  def upto_one_thousand(i)
    if i % 900 == 0
      @roman[900]
    else
      @roman[900] + translate_upto(i - 900)
    end
  end

  def upto_nine_hundred(i)
    five_hundreds = (@roman[500] * (i.digits.last / 5))
    if i % 500 == 0
      five_hundreds
    else
      five_hundreds + translate_upto(i - ((i.digits.last / 5) * 500))
    end
  end

  def upto_five_hundred(i)
    hundreds = (@roman[100] * i.digits.last)
    if i % 100 == 0
      hundreds
    else
      hundreds + translate_upto(i - (i.digits.last * 100))
    end
  end

  def upto_one_hundred(i)
    @roman[90] + upto_nine(i.digits.first)
  end

  def upto_ninety(i)
    @roman[50] + translate_upto(i - 50)
  end

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
      @ones = @roman[i] + @ones
    else
      # Needs to find mapping number
      @ones += "I"
      @ones = upto_nine(i -= 1)
    end
  end
end

# When finished, think of recursive solution if there is one

trans = Translator.new
int = 999
ary = []

(1..int).each do |i|
  ary << trans.translate_upto(i)
end

#print ary
print trans.translate_upto(801)