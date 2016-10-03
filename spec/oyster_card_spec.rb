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

      
    end


  end
