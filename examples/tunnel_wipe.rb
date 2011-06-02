require "visualizer"

class TunnelWipe < Visualizer
  # play with diameter min and max to get different effects
  def draw
    super
    update_sound
    if @diameter.nil? || @diameter > height#(height > width ? height : width)*2
      set_colors
      @diameter = height/2#10
    end

    fill @red, @green, @blue
    stroke @red+20, @green+20, @blue+20
    ellipse(width/2,height/2, @diameter,@diameter)

    @diameter *= 1.1
  end

  def set_colors
    @red    = @scaled_ffts[7]*255
    @green  = @scaled_ffts[8]*255
    @blue   = @scaled_ffts[9]*255
  end
end

TunnelWipe.new :title => "TunnelWipe"