require 'docking_station'

describe Dockingstation do
  it 'releases a bike' do
    dockingstation = Dockingstation.new
    expect(dockingstation.release_bike).to eq 'bike released!'
  end
end
