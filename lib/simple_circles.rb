require 'visualizer'

#class Effect
#  def initialize(visualizer)
#    @visualizer = visualizer
#  end
#
#  def method_missing(&args)
#    begin
#      @visualizer.send(args[0],args[1..(args.length - 1)])
#    rescue NoMethodError => e
#      raise e
#    end
#  end
#end

class SimpleCircles < Effect
  def draw
    super
    @size = @v.vars[:scaled_ffts][1]*@v.height
    @size *= 4 if @v.vars[:beat].is_onset
    @x1 = @v.vars[:scaled_ffts][0]*@v.width + @v.width/2
    @y1 = @v.vars[:scaled_ffts][1]*@v.height + @v.height/2
    @red1 = @v.vars[:scaled_ffts][2]*255
    @green1 = @v.vars[:scaled_ffts][3]*255
    @blue1 = @v.vars[:scaled_ffts][4]*255

    @v.fill @red1, @green1, @blue1
    @v.stroke @red1+20, @green1+20, @blue1+20
    @v.ellipse(@x1, @y1, @size, @size)

    @x2  = @v.width/2 - @v.vars[:scaled_ffts][5]*@v.width
    @y2  = @v.height/2 - @v.vars[:scaled_ffts][6]*@v.height
    @red    = @v.vars[:scaled_ffts][7]*255
    @green  = @v.vars[:scaled_ffts][8]*255
    @blue   = @v.vars[:scaled_ffts][9]*255

    @v.fill @red, @green, @blue
    @v.stroke @red+20, @green+20, @blue+20
    @v.ellipse(@x2, @y2, @size, @size)
  end
end
