# require 'data_mapper'
# require 'dm-postgres-adapter'
#
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, Text
end

# DataMapper::Logger.new($stdout, :debug)
# DataMapper.finalize
# DataMapper.auto_upgrade!
