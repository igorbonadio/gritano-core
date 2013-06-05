module Gritano
  module Core
    class Migration
      def self.migrate(connection_params)
        ActiveRecord::Base.establish_connection(connection_params)
        ActiveRecord::Migrator.migrate(File.join(File.dirname(__FILE__), '../../db/migrate'), ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
      end
    end
  end
end