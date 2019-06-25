require "thor"
class Cli < Thor
  
  desc "mongodb [OPTIONS]", "创建mongodb的备份文件"
  long_desc <<-D
    创建mongodb的备份文件, 如果需要额外的参数可以使用mongodb [OPTIONS] [mongodump OPTIONS] 详细请参考(mongodump OPTIONS): https://docs.mongodb.com/v3.0/reference/program/mongodump/#options 
  D
  option :out, :banner => "path", :type => :string, :aliases => :o, :required => true
  option :db, :banner => 'database', :type => :string, :aliases => :d
  def mongodb(*args)
    require_relative "cli/mongodb"
    Mongodb.new(options, args).run
  end
end

Cli.start(ARGV)