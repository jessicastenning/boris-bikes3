require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to (:release_bike) }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to(:bikes) }

describe '#release_bike' do
  it 'releases a working bike' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq bike
  end
  it 'raises an error when no bikes are available' do
      expect{ subject.release_bike }. to raise_error('no bikes available')
  end
end

describe '#dock_bike'
  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to include bike
  end
  it 'does not allow bikes to be docked once capacity is reached' do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }
    expect{ subject.dock_bike(bike) }.to raise_error('docking station is full')
end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes).to include bike
  end

  describe '#initialize' do
    it 'has a default capacity of 20 when no value is passed on initialization' do
      station = DockingStation.new
      expect(station.capacity).to eq 20
    end
  end

end
