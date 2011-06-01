# Visualizer
# run with command: rp5 run visulizer.rb

require 'visualization'
Dir["examples/*.rb"].each {|f| require f}

class Visualizer < Processing::App
  load_library "minim"

  def setup
    smooth
    size(1280,760)
    background 10    
    @visualization = TunnelWipe.new(self)
  end
  
  def draw
    @visualization.update_sound
    @visualization.draw
  end
end

Visualizer.new :title => "Visualizer"
