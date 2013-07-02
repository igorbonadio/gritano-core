module Gritano
  module Core
    class Key < ActiveRecord::Base
      belongs_to :user
      
      validates :name, presence: true
      validates :name, uniqueness: {scope: :user_id}

      validates :key, presence: true
      validates :key, format: /\Assh-(?:dss|rsa) .*/
      validates :user_id, presence: true

      def key=(pubkey)
        write_attribute(:key, pubkey.scan(/\Assh-(?:dss|rsa) .*/)[0][0..-1])
      rescue
        write_attribute(:key, "")
      end
    end
  end
end