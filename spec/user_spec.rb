require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Gritano::Core
  describe User do
    it "should be invalid without a login" do
      User.new.should be_invalid
    end

    it "should be valid with a login" do
      User.new(login: 'igorbonadio').should be_valid
    end

    it "should have an unique login" do
      User.create(login: 'igorbonadio')
      User.new(login: 'igorbonadio').should be_invalid
    end

    it "is not admin by default" do
      User.new(login: 'igorbonadio').should_not be_admin
    end

    it "can be admin" do
      User.new(login: 'igorbonadio', admin: true).should be_admin
    end
  end
end