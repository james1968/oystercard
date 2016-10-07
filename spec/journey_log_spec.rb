require 'journey_log'

describe JourneyLog do
  subject(:journey_log) {described_class.new}
  let(:station) { double :station}
  let(:journey_class){double :journey_class, new: journey}

  describe 'initialization' do
    it 'has an empty journey' do
      expect(subject.journeys).to be_empty
      end
    it 'has an entry station set to nil' do
      expect(subject.entry_station).to eq nil
      end
    it 'has an exit station set to nil' do
      expect(subject.exit_station).to eq nil
      end
  end

  describe '#start' do
    it 'starts a journey' do
      expect(subject.start(station)).to include {exit station: :exit_station}
      end

    it 'records a journey' do
      expect(subject.journeys).to include {exit station: :exit_station}
      end

  describe '#fare' do

    it 'calculates a fare' do
        expect(subject.fare).to eq JourneyLog::PENALTY_FARE
    end


    it 'has a penalty fare by default' do
          expect(subject.fare).to eq JourneyLog::PENALTY_FARE
        end
    end
  end

end
