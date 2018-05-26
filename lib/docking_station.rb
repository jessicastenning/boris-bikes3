require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "no bikes available" if empty?
    fail "no working bikes, bike cannot be released" if all_broken?
    @bikes.pop
  end

  def dock_bike(bike)
    fail "docking station is full" if full?
    @bikes << bike
  end

private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def all_broken?
    bikes.all? {|bike| bike.broken? }
  end

end
