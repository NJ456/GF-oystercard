class Journey
attr_reader :entry_station
  def initialize(entry_station)
    @entry_station = entry_station
  end

  def in_journey
    if @entry_station != nil
      return true
    else return false
    end
  end

  def end_journey(exit_station)
    list_of_journeys = {:start => entry_station, :finish => exit_station }
    @all_journeys << list_of_journeys
    @entry_station = nil
  end

end
