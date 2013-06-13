module Gritano
  module Core
    class Key < ActiveRecord::Base
      validates :name, presence: true
      validates :name, uniqueness: {scope: :user_id}

      validates :key, presence: true
      validates :user_id, presence: true

      def key=(pubkey)
        write_attribute(:key, pubkey.scan(/\Assh-(?:dss|rsa) .* /)[0][0..-2])
      end
    end
  end
end