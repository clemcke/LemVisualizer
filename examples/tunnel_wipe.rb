class TunnelWipe < Effect
  # play with diameter min and max to get different effects
  def draw
    super
    if @diameter.nil? || @diameter > @v.height#(height > width ? height : width)*2
      set_colors
      @diameter = @v.height/2#10
    end

    @v.fill @red, @green, @blue
    @v.stroke @red+20, @green+20, @blue+20
    @v.ellipse(@v.width/2,@v.height/2, @diameter,@diameter)

    @diameter *= 1.1
  end

  def set_colors
    @red    = @v.vars[:scaled_ffts][7]*255
    @green  = @v.vars[:scaled_ffts][8]*255
    @blue   = @v.vars[:scaled_ffts][9]*255
  end
end
