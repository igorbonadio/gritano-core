module Gritano
  module Core
    class Permission < ActiveRecord::Base
      belongs_to :contributor, class_name: "User"
      belongs_to :repository
    end
  end
end