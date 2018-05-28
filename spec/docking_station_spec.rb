require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike, working: true, broken?: false }
  let(:broken_bike) { double :broken_bike, working: false, broken?: true }

  describe '#release_bike' do
    it 'releases a working bike' do
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when no bikes are available' do
      expect{ subject.release_bike }. to raise_error('no bikes available')
    end
    it 'does not release broken bikes' do
      subject.dock_bike(broken_bike)
      expect{ subject.release_bike }. to raise_error('no working bikes, bike cannot be released')
    end
  end

  describe '#dock_bike' do
    it 'docks a bike' do
      expect(subject.dock_bike(bike)).to include bike
    end
    it 'does not allow bikes to be docked once capacity is reached' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }
      expect{ subject.dock_bike(bike) }.to raise_error('docking station is full')
    end
    it 'allows broken bikes to be docked' do
      subject.dock_bike(broken_bike)
      expect(subject.bikes).to include broken_bike
    end
  end

  describe '#bikes' do
    it 'returns docked bikes' do
      subject.dock_bike(bike)
      expect(subject.bikes).to include bike
    end
  end
  
  describe '#initialize' do
    it 'has a default capacity of 20 when no value is passed on initialization' do
      expect(subject.capacity).to eq 20
    end
  end
end
