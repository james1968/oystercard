require 'spec_helper'

  describe OysterCard do

    it "has a balance of 0 on creation" do
      expect(subject.balance).to eq(0)
    end

  end
