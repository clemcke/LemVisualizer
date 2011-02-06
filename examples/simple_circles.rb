class SimpleCircles < Visualization
  def draw
    @size = @scaled_ffts[1]*height
    @size *= 4 if @beat.is_onset
    @x1 = @scaled_ffts[0]*width + width/2
    @y1 = @scaled_ffts[1]*height + height/2
    @red1 = @scaled_ffts[2]*255
    @green1 = @scaled_ffts[3]*255
    @blue1 = @scaled_ffts[4]*255

    @visualizer.fill @red1, @green1, @blue1
    @visualizer.stroke @red1+20, @green1+20, @blue1+20
    @visualizer.ellipse(@x1, @y1, @size, @size)

    @x2  = width/2 - @scaled_ffts[5]*width
    @y2  = height/2 - @scaled_ffts[6]*height
    @red2    = @scaled_ffts[7]*255
    @green2  = @scaled_ffts[8]*255
    @blue2   = @scaled_ffts[9]*255

    @visualizer.fill @red2, @green2, @blue2
    @visualizer.stroke @red2+20, @green2+20, @blue2+20
    @visualizer.ellipse(@x2, @y2, @size, @size)
  end
end