class OysterCard

  attr_reader :balance

MAXIMUM_BALANCE = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(integer)
    fail "Exceeded maximum balance of £#{MAXIMUM_BALANCE}" if @balance + integer > MAXIMUM_BALANCE
    @balance += integer
  end
end
