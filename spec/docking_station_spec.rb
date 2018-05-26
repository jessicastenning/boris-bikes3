require 'docking_station'

describe Dockingstation do
  it { is_expected.to respond_to :release_bike }

  it 'releases a working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
