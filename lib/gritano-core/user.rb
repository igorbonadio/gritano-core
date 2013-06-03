module Gritano
  module Core
    class User < ActiveRecord::Base
      validates :login, presence: true
      validates :login, uniqueness: true
    end
  end
end