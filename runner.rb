require 'cli'
require 'pathname'
require 'scmd'

class DeasBenchRunner

  HOST = "0.0.0.0"
  PORT = "9292"
  SLEEP = 2
  HIT = "wrk -d2s -c10 -t2"

  def initialize(args, opts)
    @folder = args.first
    if @folder.to_s.empty?
      raise CLIRB::Error, "please specify a folder to bench."
    end

    @folder_path = Pathname.new(File.expand_path("../#{@folder}", __FILE__))
    if !@folder_path.exist?
      raise ArgumentError, "no #{@folder.inspect} folder"
    end
    if !@folder_path.join('config.ru').exist?
      raise ArgumentError, "no #{@folder.inspect} config.ru"
    end

    @gemfile_path = @folder_path.join('Gemfile')
    if !@gemfile_path.exist?
      raise ArgumentError, "no #{@folder.inspect} Gemfile"
    end

    @results_path = @folder_path.join('bench_results.txt')
  end

  def run
    puts "\nstarting the local `#{@folder}` server...\n"
    server_cmd = cmd(rackup_cmd_str)
    server_cmd.start
    sleep(SLEEP)
    puts server_cmd.stderr

    puts "\nbenching against the local server...\n"
    cmd(reset_cmd_str).run!
    cmd(warmup_cmd_str).run!
    cmd(bench_cmd_str).run!

    puts "\nresults:"
    puts cmd(results_cmd_str).run!.stdout

    puts "\nstopping the local server..."
    server_cmd.kill('INT')
  end

  private

  def url
    "http://#{HOST}:#{PORT}"
  end

  def results_cmd_str
    "cat #{@results_path}"
  end

  def bench_cmd_str
    "wrk -d2s -c10 -t2 #{url} > #{@results_path}"
  end

  def warmup_cmd_str
    "curl -I #{url}"
  end

  def reset_cmd_str
    "rm -f #{@results_path}"
  end

  def rackup_cmd_str
    "cd #{@folder_path} &&"\
    " BUNDLE_GEMFILE=#{@gemfile_path}"\
    " bundle exec --verbose rackup --host #{HOST} --port #{PORT} config.ru"
  end

  def cmd(cmd_string)
    Scmd.new(cmd_string).tap{ |c| puts "** #{c}" }
  end

end
