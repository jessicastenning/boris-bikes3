require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

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
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
