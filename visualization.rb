class Visualization
  import "ddf.minim"
  import "ddf.minim.analysis"
  
  def initialize(visualizer)
    @visualizer = visualizer
    @minim = Minim.new(@visualizer)
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

  def height
    @visualizer.height
  end

  def width
    @visualizer.width
  end
end