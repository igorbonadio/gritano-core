require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Gritano::Core
  describe Key do
    it "should be invalid without a name" do
      Key.new(user_id: 1, key: File.open('spec/key.pub').readlines.join).should be_invalid
    end

    it "should be invalid without a ssh key" do
      Key.new(user_id: 1, name: "my_key").should be_invalid
    end

    it "should belongs to a user" do
      Key.new(name: "my_key", key: File.open('spec/key.pub').readlines.join).should be_invalid
    end

    it "should have a unique name per user" do
      u1 = User.create(login: 'igorbonadio')
      u2 = User.create(login: 'jessicaeto')
      u1.keys.create(name: 'my_key', key: File.open('spec/key.pub').readlines.join)
      u1.keys.new(name: 'my_key', key: File.open('spec/key.pub').readlines.join).should be_invalid
      u2.keys.new(name: 'my_key', key: File.open('spec/key.pub').readlines.join).should be_valid
    end
  end
end