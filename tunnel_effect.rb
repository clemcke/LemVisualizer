class TunnelEffect < Effect
  def initialize
    draw do
      if @diameter.nil? || @diameter > height#(height > width ? height : width)*2
        @red    = @scaled_ffts[7]*255
        @green  = @scaled_ffts[8]*255
        @blue   = @scaled_ffts[9]*255
        @diameter = height/2#10
      end

      fill @red, @green, @blue
      stroke @red+20, @green+20, @blue+20
      ellipse(width/2,height/2, @diameter,@diameter)

      @diameter *= 1.1
    end
  end
end