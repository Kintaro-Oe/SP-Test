require 'log_parse'

describe LogParse do
  subject(:log_parse) { described_class.new }

  describe '#count_all_visits' do
    it 'returns a hash with the number of visits for each page' do
      expect(log_parse.count_all_visits("/help_page/1 126.318.035.038")).to eq({"/help_page/1":1})
    end
  end
end
