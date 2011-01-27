# Visualizer

class Visualizer < Processing::App
  load_library "minim"
  import "ddf.minim"
  import "ddf.minim.analysis"

  def setup
    smooth
    size(1080,600)
    background 10    
    setup_sound
  end
  
  def draw
    update_sound
    begin
      animate_sound
    rescue => e
      puts e.message
    end
  end
  
  def setup_sound
    @minim = Minim.new(self)
    @input = @minim.get_line_in
    @fft = FFT.new(@input.left.size, 44100)
    @beat = BeatDetect.new

    @freqs = [60, 170, 310, 600, 1000, 3000, 6000, 12000, 14000, 16000]

    @current_ffts = Array.new(@freqs.size, 0.001)
    @previous_ffts= Array.new(@freqs.size, 0.001)
    @max_ffts = Array.new(@freqs.size, 0.001)
    @scaled_ffts = Array.new(@freqs.size, 0.001)
  
    @fft_smoothing = 0.8
  end

  def update_sound
    @fft.forward(@input.left)
    @previous_ffts = @current_ffts
    @freqs.each_with_index do |freq, i|
      new_fft = @fft.get_freq(freq)
      @max_ffts[i] = new_fft if new_fft > @max_ffts[i]
      @current_ffts[i] = ((1 - @fft_smoothing) * new_fft) + (@fft_smoothing * @previous_ffts[i])
      @scaled_ffts[i] = (@current_ffts[i]/@max_ffts[i])
    end
    @beat.detect(@input.left)
  end

  def animate_sound
    animate_circles
  end

  def animate_circles
    @size = @scaled_ffts[1]*height
    @size *= 4 if @beat.is_onset
    @x1 = @scaled_ffts[0]*width + width/2
    @y1 = @scaled_ffts[1]*height + height/2
    @red1 = @scaled_ffts[2]*255
    @green1 = @scaled_ffts[3]*255
    @blue1 = @scaled_ffts[4]*255
    
    fill @red1, @green1, @blue1
    stroke @red1+20, @green1+20, @blue1+20
    ellipse(@x1, @y1, @size, @size)

    @x2  = width/2 - @scaled_ffts[5]*width
    @y2  = height/2 - @scaled_ffts[6]*height
    @red2    = @scaled_ffts[7]*255
    @green2  = @scaled_ffts[8]*255
    @blue2   = @scaled_ffts[9]*255

    fill @red2, @green2, @blue2
    stroke @red2+20, @green2+20, @blue2+20
    ellipse(@x2, @y2, @size, @size)
  end
end

Visualizer.new :title => "Visualizer"
