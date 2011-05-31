class BouncingCircles < Visualization
  def draw
    @x_min ||= 0
    @x_velocity ||= 1
    @y_min ||= 0
    @y_velocity ||= 1

    @size = @scaled_ffts[5]*height
    @size *= 4 if @beat.is_onset
    @red1 = @scaled_ffts[5]*255
    @green1 = @scaled_ffts[6]*255
    @blue1 = @scaled_ffts[4]*255
    @visualizer.fill @red1, @green1, @blue1
    @visualizer.stroke @red1+20, @green1+20, @blue1+20

    @x_min += width/500*@x_velocity
    @y_min += height/200*@y_velocity
    @x1 = (1 - @scaled_ffts[5])*width/3 + @x_min
    @y1 = (1 - @scaled_ffts[5])*height/3 + @y_min
    @x_velocity = -1 if !@beat.is_onset && @x1 + @size/2 > width
    @x_velocity = 1 if !@beat.is_onset && @x1 - @size/2 < 0
    @y_velocity = -1 if !@beat.is_onset && @y1 + @size/2 > height
    @y_velocity = 1 if !@beat.is_onset && @y1 - @size/2 < 0

    @visualizer.ellipse(@x1, @y1, @size, @size)
  end
end