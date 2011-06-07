require 'visualizer'
require 'effect'
Dir["examples/*.rb"].each {|f| require f}

viz = Visualizer.new :title => "Visualizer"
TunnelWipe.new(viz)
