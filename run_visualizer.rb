require 'visualizer'
require 'effect'
Dir["lib/*.rb"].each {|f| require f}

viz = Visualizer.new :title => "Visualizer", :width => 600, :height => 600
BouncingCircles.new(viz)