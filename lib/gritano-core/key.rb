module Gritano
  module Core
    class Key < ActiveRecord::Base
      validates :name, presence: true
      validates :name, uniqueness: {scope: :user_id}

      validates :key, presence: true
      validates :user_id, presence: true
    end
  end
end