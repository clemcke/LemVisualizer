require 'visualizer'

class BouncingCircles2 < Visualizer
  def draw
    # change which color changes on bounce
    # make object w/bounce event
    # has a more subtle color shift

    super
    @x_min ||= 0
    @x_velocity ||= 1
    @y_min ||= 0
    @y_velocity ||= 1
    @red1 ||= @scaled_ffts[3]*255
    @green1 ||= @scaled_ffts[4]*255
    @blue1 ||= @scaled_ffts[5]*255
    @changing_color ||= rand(3)

    case @changing_color
      when 0 then
        @red1 = @scaled_ffts[@changing_color + 3]*255
      when 1 then
        @green1 = @scaled_ffts[@changing_color + 3]*255
      when 2 then
        @blue1 = @scaled_ffts[@changing_color + 3]*255
    end

    @size = @scaled_ffts[5]*height
    @size *= 4 if @beat.is_onset

    fill @red1, @green1, @blue1
    stroke @red1+20, @green1+20, @blue1+20

    @x_min += width/500*@x_velocity
    @y_min += height/200*@y_velocity
    @x1 = (1 - @scaled_ffts[5])*width/3 + @x_min
    @y1 = (1 - @scaled_ffts[5])*height/3 + @y_min
    (@changing_color = rand(3)) && @x_velocity = -1 if !@beat.is_onset && @x1 + @size/2 > width
    (@changing_color = rand(3)) && @x_velocity = 1 if !@beat.is_onset && @x1 - @size/2 < 0
    (@changing_color = rand(3)) && @y_velocity = -1 if !@beat.is_onset && @y1 + @size/2 > height
    (@changing_color = rand(3)) && @y_velocity = 1 if !@beat.is_onset && @y1 - @size/2 < 0

    ellipse(@x1, @y1, @size, @size)
  end
end
