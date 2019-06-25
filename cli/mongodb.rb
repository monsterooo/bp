class Cli::Mongodb
  attr_reader :options, :args
  
  def initialize(options, args)
    @options = options
    @args = args
  end
  def run
    has_env
    shell = ["mongodump --out #{options[:out]}"]
    shell << "--db #{options[:db]}" if options[:db]
    shell.concat(args) unless args.empty?
    `#{shell.join(' ')}`
  end

  private
    def has_env
      raise 'Not found mongodump' if `which mongodump`.empty?
      raise 'Please specify --out option' unless options[:out]
    end
end