class Effect

  def initialize(visualizer)
    @v = visualizer
    self.setup
    @v.effects << self
  end

  def setup
   #override here
  end

  def draw
    @v.update_sound
    #always call super as the first line of draw
  end
end