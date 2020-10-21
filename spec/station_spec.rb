require 'station'

RSpec.describe Station do


 describe '#stations' do
   it "tells us the name of stations and zones" do
     station = Station.new('Berry', 3)
     expect(station.name).to eq('Berry')
     expect(station.zone).to eq(3)
    end
  end
end
