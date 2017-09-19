class Translator
  attr_reader :num

  def initialize
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

  def translate_rec(i)
    if @roman.key?(i)
      @recorder += i
      @roman[i]
    else
      @remainder += 1
      translate_rec(i -= 1)
    end
  end

  def to_trans(i)
    until @recorder == @original
      next_place = translate_rec(i)
      @num += next_place
      i = @remainder
      @remainder = 0
    end
  end

  def call(i)
    @num = ""
    @remainder = 0
    @recorder = 0
    @original = i
    to_trans(i)
  end
end

trans = Translator.new

#ary = []
#(1..int).each do |i|
  #ary << trans.call(i)
#end
#print ary

print "Type any number between 1 and 4999\n\n"
loop do
  int = gets.chomp!.to_i
  next if int == 0
  trans.call(int)
  puts trans.num
end