require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'pathname'

module Gritano::Core
  describe Migration do
    it "should migrate a database" do
      params = {adapter: 'sqlite3', database: 'db/development.sqlite3'}
      root = Pathname.new(File.dirname(__FILE__)).split[0]
      ActiveRecord::Base.should_receive(:establish_connection).with(params)
      ActiveRecord::Migrator.should_receive(:migrate).with(File.join(root, 'lib/gritano-core/', '../../db/migrate'), nil)
      Migration.migrate(params)
    end
  end
end