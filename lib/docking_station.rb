require_relative 'bike'

class Dockingstation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "no bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail "docking station is full" if @bikes.length > 19
    @bikes << bike
  end

end
