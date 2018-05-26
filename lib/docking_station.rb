require_relative 'bike'

class Dockingstation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "no bikes available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail "docking station is full" if full?
    @bikes << bike
  end

private

  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.empty?
  end

end
