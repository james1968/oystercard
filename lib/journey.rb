# require 'station'

class Journey
PENALTY_FARE = 6

attr_reader :entry_station, :exit_station

  def initialize(*entry_station)
    @entry_station = nil
    @exit_station = nil
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def complete?
    !!exit_station
  end


  def fare(fare = PENALTY_FARE)
      if @entry_station == nil || @exit_station == nil
      return PENALTY_FARE
      else
      fare = 1
      end
  end

end
