module Gritano
  module Core
    class User < ActiveRecord::Base
      validates :login, presence: true
      validates :login, uniqueness: true

      has_many :keys
      has_many :owned_repositories, foreign_key: "owner_id", class_name: "Repository"
      has_many :permissions, foreign_key: "contributor_id"
      has_many :repositories, through: :permissions
    end
  end
end