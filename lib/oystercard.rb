require_relative 'journey'

class Oystercard
  attr_reader :balance


  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(balance = 0)
    @balance = balance
    @journey = Journey.new
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    fail "Card limit of £#{MAXIMUM_BALANCE} has been reached." if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if @balance < MINIMUM_BALANCE
    @journey_log.start(entry_station)
  end

  def touch_out(exit_station)
    @journey_log.finish(exit_station)
    deduct(@journey.fare)
    @journey_log.reset
    #@journey.add_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end


end
