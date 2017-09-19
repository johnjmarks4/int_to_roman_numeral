class Translation
  attr_reader :num

  def initialize(i)
    @num = ""
    @remainder = 0
    @recorder = 0
    @original = i
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

    track_progress(i)
  end

  def track_progress(i)
    until @recorder == @original
      @num += translate(i)
      i = @remainder
      @remainder = 0
    end
  end

  def translate(i)
    if @roman.key?(i)
      @recorder += i
      @roman[i]
    else
      @remainder += 1
      translate(i -= 1)
    end
  end
end

print "Type any number between 1 and 4999\n\n"
loop do
  int = gets.chomp!.to_i
  next if int == 0
  trans = Translation.new(int)
  puts trans.num
end