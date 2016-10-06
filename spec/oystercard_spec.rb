require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  describe 'initialization' do
    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  context 'top-up card' do
    before do
      subject.top_up(described_class::MAXIMUM_BALANCE)
    end
    it 'allows a user to top-up their oystercard' do
      expect(subject.balance).to eq described_class::MAXIMUM_BALANCE
    end

    it 'will raise an error if maximum card value is reached' do
      message = "Card limit of £#{described_class::MAXIMUM_BALANCE} has been reached."
      expect{ subject.top_up(described_class::MINIMUM_BALANCE) }.to raise_error message
    end
  end

  it 'will raise error if balance is less than minimum fare' do
    #allow(subject).to receive(:entry_station)
    expect{ subject.touch_in(:entry_station) }.to raise_error "Insufficient funds"

  end

  context 'using a card' do
        before do
            subject.top_up(described_class::MINIMUM_BALANCE)
            subject.touch_in(:entry_station)
        end

      describe '#touch_in' do


      end

    describe '#touch_out' do

        it 'will reduce balance by minimum fare' do
          expect{subject.touch_out(:exit_station)}.to change {subject.balance}.by(-described_class::MINIMUM_FARE)
        end

    end
  end

end
