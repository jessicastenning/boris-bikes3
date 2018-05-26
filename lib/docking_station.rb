require_relative 'bike'

class Dockingstation

  attr_reader :bike

  def release_bike
    fail "no bikes available" unless @bike
    @bike
  end

  def dock_bike(bike)
    @bike = bike
  end

end
