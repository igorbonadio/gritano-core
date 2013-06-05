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

    it "should return a migration file" do
      Migration['create_users'].should be == File.open("db/migrate/001_create_users.rb").readlines.join
      Migration['create_keys'].should be == File.open("db/migrate/002_create_keys.rb").readlines.join
      Migration['create_repositories'].should be == File.open("db/migrate/003_create_repositories.rb").readlines.join
      Migration['create_permissions'].should be == File.open("db/migrate/004_create_permissions.rb").readlines.join
    end

    it "should return nil if the migration desn't exist" do
      Migration['create_wrong_model'].should be == nil
    end
  end
end