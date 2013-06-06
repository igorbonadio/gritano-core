module Gritano
  module Core
    class Repository < ActiveRecord::Base      
      has_many :permissions
      has_many :users, through: :permissions

      validates :name, presence: true
      validates :name, uniqueness: true
      validates :name, format: /\.git\z/
      validates :path, presence: true

      before_create :create_bare_repo
      after_destroy :destroy_bare_repo

      def create_bare_repo
        Grit::Repo.init_bare(full_path)
      end
      
      def destroy_bare_repo
        FileUtils.rm_r(full_path, force: true)
      end

      def full_path
        File.join(path, name)
      end
    end
  end
end