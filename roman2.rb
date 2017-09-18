public

class Translator

  def initialize
    @num = ""
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
      if i <= 10
        @num = ones(i)
      elsif i > 10
        @num = tens(i)
      end
      ary << @num
    end
    ary
  end

  def tens(i)
    "X" + ones(i - 10)
  end

  def ones(i)
    if @roman.key?(i)
      @num = @roman[i]
    else
      @num += "I"
    end
  end
end

trans = Translator.new
ary = trans.translate_upto(11)

ary.each { |n| puts n }