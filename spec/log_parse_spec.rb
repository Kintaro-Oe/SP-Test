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

  describe '#display_all_visits' do
    it 'returns a formatted string' do
      file = double(file)
      allow(File).to receive(:open).with("sample.log", "r").and_return(file)
      allow(file).to receive(:readlines).and_return([
        "/help_page/1 126.318.035.038",
        "/contact 184.123.665.067",
        "/contact 444.123.665.067",
        "/home 184.123.665.067",
        "/about/2 444.701.448.104",
        "/about/2 184.701.448.104"
        ])
      allow(file).to receive(:close)

      log_parse.count_all_visits("sample.log")
      data = log_parse.sort_hash(log_parse.all_visits)

      expect { log_parse.display_data(data) }.to output(
        "/about/2 2 visits\n" +
        "/contact 2 visits\n" +
        "/help_page/1 1 visit\n" +
        "/home 1 visit\n"
      ).to_stdout
    end
  end
end
