module Gritano
  module Core
    class Migration
      def self.migrate(connection_params)
        ActiveRecord::Base.establish_connection(connection_params)
        ActiveRecord::Migrator.migrate(File.join(File.dirname(__FILE__), '../../db/migrate'), ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
      end

      def self.[](migration)
        filename = Dir.entries(File.join(File.dirname(__FILE__), '../../db/migrate')).
          select { |file| /\A\d+_#{migration}\.rb\z/.match file }.first
        if filename
          File.open(File.join(File.dirname(__FILE__), '../../db/migrate', filename)).readlines.join
        end
      end
    end
  end
end