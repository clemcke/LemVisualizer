class BouncingCircles < Effect
  def draw
    super
    @x_min ||= 0
    @x_velocity ||= 1
    @y_min ||= 0
    @y_velocity ||= 1

    @size = @v.vars[:scaled_ffts][5]*@v.height
    @size *= 4 if @v.vars[:beat].is_onset
    @red1 = @v.vars[:scaled_ffts][5]*255
    @green1 = @v.vars[:scaled_ffts][6]*255
    @blue1 = @v.vars[:scaled_ffts][4]*255
    @v.fill @red1, @green1, @blue1
    @v.stroke @red1+20, @green1+20, @blue1+20

    @x_min += @v.width/500*@x_velocity
    @y_min += @v.height/200*@y_velocity
    @x1 = (1 - @v.vars[:scaled_ffts][5])*@v.width/3 + @x_min
    @y1 = (1 - @v.vars[:scaled_ffts][5])*@v.height/3 + @y_min
    @x_velocity = -1 if !@v.vars[:beat].is_onset && @x1 + @size/2 > @v.width
    @x_velocity = 1 if !@v.vars[:beat].is_onset && @x1 - @size/2 < 0
    @y_velocity = -1 if !@v.vars[:beat].is_onset && @y1 + @size/2 > @v.height
    @y_velocity = 1 if !@v.vars[:beat].is_onset && @y1 - @size/2 < 0

    @v.ellipse(@x1, @y1, @size, @size)
  end
end
