require 'spec_helper'

  describe OysterCard do

    it "has a balance of 0 on creation" do
      expect(subject.balance).to eq(0)
    end

    describe '#top_up' do
      it 'balance is updated when topped up' do
        subject.top_up(10)
        expect(subject.balance).to eq(10)
      end

      it "only allows up to a maximum initial balance on the card" do
        maximum = OysterCard::MAXIMUM_BALANCE
        expect{subject.top_up(maximum + 1)}.to raise_error "Exceeded maximum balance of £#{maximum}"
      end

      it "can't top up more than the maximum balance" do
        maximum = OysterCard::MAXIMUM_BALANCE
        subject.top_up(maximum)
        expect{subject.top_up(10)}.to raise_error "Exceeded maximum balance of £#{maximum}"
      end
    end
  end
