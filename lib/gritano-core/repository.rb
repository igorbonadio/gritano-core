module Gritano
  module Core
    class Repository < ActiveRecord::Base
      belongs_to :owner, class_name: "User"
      
      has_many :permissions
      has_many :contributors, through: :permissions

      validates :name, presence: true
      validates :name, uniqueness: true
      validates :path, presence: true
      validates :owner_id, presence: true
    end
  end
end