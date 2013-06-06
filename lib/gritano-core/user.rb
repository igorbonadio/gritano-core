module Gritano
  module Core
    class User < ActiveRecord::Base
      validates :login, presence: true
      validates :login, uniqueness: true

      has_many :keys
      has_many :permissions, foreign_key: "contributor_id"
      has_many :repositories, through: :permissions

      def add_access(repo, access_type)
        permission = repo.permissions.where(contributor_id: self.id).first || repo.permissions.new(contributor_id: self.id)
        permission.add_access(access_type)
        permission.save
      end

      def remove_access(repo, access_type)
        permission = repo.permissions.where(contributor_id: self.id).first || repo.permissions.new(contributor_id: self.id)
        permission.remove_access(access_type)
        permission.save
      end

      def check_access(repo, access_type)
        permission = repo.permissions.where(contributor_id: self.id).first
        if permission
          permission.is(access_type)
        else
          false
        end
      end
    end
  end
end