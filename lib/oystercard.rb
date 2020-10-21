class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :all_journeys, :journey
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @all_journeys = []
    @journey = nil
  end

  def top_up(amount)
    raise "£#{ LIMIT } limit exceeded" if @balance + amount > LIMIT
    @balance += amount
  end

  private
  def deduct(amount)
    # Remember to not allow negative values
    @balance -= amount
  end
 public



  def touch_in(entry_station)
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @journey.end_journey(exit_station)
    deduct(MINIMUM_FARE)
  end

  def minimum_fare
    raise "please top-up, minimum fare £#{ MINIMUM_FARE }" if @balance < MINIMUM_FARE
  end
end
