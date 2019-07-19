require 'log_parse'

describe LogParse do
  subject(:log_parse) { described_class.new }

  describe '#try_load_log' do
    it 'escapes from program if no file is given' do
      expect(log_parse.try_load_log).to eq(nil)
    end
    # it 'returns message as to whether file given is successfully loaded' do
    #
    # end
  end

  describe '#count_all_visits' do
    it 'returns a hash showing each new page with a single visit' do
      file = double(file)
      allow(File).to receive(:open).with("sample.log", "r").and_return(file)
      allow(file).to receive(:readlines).and_return(["/help_page/1 126.318.035.038"])
      allow(file).to receive(:close)

      expect(log_parse.count_all_visits("sample.log")).to eq({"/help_page/1" =>1})
    end
    it 'returns a hash showing each new page with visit counted' do
      file = double(file)
      allow(File).to receive(:open).with("sample.log", "r").and_return(file)
      allow(file).to receive(:readlines).and_return(["/help_page/1 126.318.035.038", "/help_page/1 126.318.035.038"])
      allow(file).to receive(:close)

      expect(log_parse.count_all_visits("sample.log")).to eq({"/help_page/1" =>2})
    end
  end

  describe '#sort_hash' do
    it 'returns hash sorted high to low and also aphabetised' do
      expect(log_parse.sort_hash({
        "/help_page/1"=>1,
        "/contact"=>2,
        "/home"=>1,
        "/about/2"=>2
        }).first).to eq(["/about/2", 2])
    end
  end

  # describe '#display_all_visits' do
  #   it 'returns a formatted string' do
  #
  #   end
  # end
end
