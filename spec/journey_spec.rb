require 'journey'
RSpec.describe Journey do
  let(:oystercard) {Oystercard.new}
  let(:entry_station) {double("dalston station")}
  let(:exit_station) {double("highgate station")}

  describe '#touch_in' do
    it 'checks if card in a journey' do
      oystercard.touch_in(entry_station)
      expect(oystercard.journey.in_journey).to eq true
    end
  end
  it 'remembers entry station' do
    oystercard.touch_in(entry_station)
    expect(oystercard.journey.entry_station).to eq(entry_station)
  end

  describe '#touch_out' do
      it 'check if card is not in a journey' do
        oystercard.touch_out(exit_station)
        expect(oystercard.journey.in_journey).to eq false
      end
      it 'deducts money from balance' do
        oystercard.top_up(20)
        oystercard.touch_out(exit_station)
        expect{oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by(-1)
      end
      it 'saves your list of journeys' do
        oystercard.top_up(25)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.all_journeys).to eq([{:start => entry_station, :finish => exit_station}])
      end
    end
end
