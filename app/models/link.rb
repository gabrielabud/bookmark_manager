require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

class Link
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, Text
end


DataMapper.finalize
DataMapper.auto_upgrade!
