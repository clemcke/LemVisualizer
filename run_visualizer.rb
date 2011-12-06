require 'visualizer'
require 'effect'
Dir["lib/*.rb"].each {|f| require f}

viz = Visualizer.new :title => "Visualizer"
BouncingCircles2.new(viz)
BouncingCircles.new(viz)

