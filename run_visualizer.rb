require 'visualizer'
require 'effect'
Dir["lib/*.rb"].each {|f| require f}

viz = Visualizer.new :title => "Visualizer", :width => 200, :height => 200
Sandbox2.new(viz)