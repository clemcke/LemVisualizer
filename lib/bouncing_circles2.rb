class BouncingCircles2 < Effect
  def draw
    # change which color changes on bounce
    # make object w/bounce event
    # has a more subtle color shift

    super
    @x_min ||= 0
    @x_velocity ||= 1
    @y_min ||= 0
    @y_velocity ||= 1
    @red1 ||= @v.vars[:scaled_ffts][3]*255
    @green1 ||= @v.vars[:scaled_ffts][4]*255
    @blue1 ||= @v.vars[:scaled_ffts][5]*255
    @changing_color ||= rand(3)

    case @changing_color
      when 0 then
        @red1 = @v.vars[:scaled_ffts][@changing_color + 3]*255
      when 1 then
        @green1 = @v.vars[:scaled_ffts][@changing_color + 3]*255
      when 2 then
        @blue1 = @v.vars[:scaled_ffts][@changing_color + 3]*255
    end

    @size = @v.vars[:scaled_ffts][5]*@v.height
    @size *= 4 if @v.vars[:beat].is_onset

    @v.fill @red1, @green1, @blue1
    @v.stroke @red1+20, @green1+20, @blue1+20

    @x_min += @v.width/500*@x_velocity
    @y_min += @v.height/200*@y_velocity
    @x1 = (1 - @v.vars[:scaled_ffts][5])*@v.width/3 + @x_min
    @y1 = (1 - @v.vars[:scaled_ffts][5])*@v.height/3 + @y_min
    (@changing_color = rand(3)) && @x_velocity = -1 if !@v.vars[:beat].is_onset && @x1 + @size/2 > @v.width
    (@changing_color = rand(3)) && @x_velocity = 1 if !@v.vars[:beat].is_onset && @x1 - @size/2 < 0
    (@changing_color = rand(3)) && @y_velocity = -1 if !@v.vars[:beat].is_onset && @y1 + @size/2 > @v.height
    (@changing_color = rand(3)) && @y_velocity = 1 if !@v.vars[:beat].is_onset && @y1 - @size/2 < 0

    @v.ellipse(@x1, @y1, @size, @size)
  end
end
