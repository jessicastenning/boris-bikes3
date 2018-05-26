require 'bike'

describe Bike do
    it { is_expected.to respond_to :working? }
    it { is_expected.to respond_to :report_broken }
    it { is_expected.to respond_to :broken? }
    
    it 'reports a broken bike' do
      subject.report_broken
      expect(subject.broken?).to eq true
    end
end
