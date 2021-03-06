module Gritano
  module Core
    class Permission < ActiveRecord::Base
      belongs_to :user
      belongs_to :repository

      validates :user_id, presence: true
      validates :repository_id, presence: true
      validates :access, presence: true

      def add_access(type)
        if type == :read
          self.access = READ | (self.access || 0)
        elsif type == :write
          self.access = WRITE | (self.access || 0)
        else
          return false
        end
        return true
      end

      def remove_access(access)
        if access == :read
          self.access = (self.access || 0) & (~ READ)
        elsif access == :write
          self.access = (self.access || 0) & (~ WRITE)
        else
          return false
        end
        return true
      end

      def is(type)
        if type == :read
          return (self.access & READ) == READ
        elsif type == :write
          return (self.access & WRITE) == WRITE
        end
      end

      READ = 1
      WRITE = 2
    end
  end
end