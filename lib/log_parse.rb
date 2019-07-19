class LogParse
  def initialize
    @all_visits = {}
  end

  def count_all_visits(filename)
    file = File.open(filename, "r")

    file.readlines.each do |line|
      visit_details = line.split(" ")
      page = visit_details[0]
      if @all_visits.include? page
        @all_visits[page] += 1
      else
        @all_visits[page] = 1
      end
    end
    file.close

    @all_visits
  end

  def sort_hash(hash_input)
    hash_input.sort_by {|k,v| [-v,k]}.to_h #high to low and alphabetised
  end

  def try_load_log
    filename = ARGV.first  # first argument from the command line
    return if filename.nil? # get out of the method if it isn't given
    if File.exists?(filename)
      puts "Loaded from file #{filename}"
      count_all_visits(filename)
    else
     puts "sorry, #{filename} doesn't exist."
    end
  end

end

log_parse = LogParse.new
log_parse.try_load_log
