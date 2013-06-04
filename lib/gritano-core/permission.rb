module Gritano
  module Core
    class Permission < ActiveRecord::Base
      belongs_to :contributor, class_name: "User"
      belongs_to :repository

      validates :contributor_id, presence: true
      validates :repository_id, presence: true
      validates :access, presence: true
    end
  end
end