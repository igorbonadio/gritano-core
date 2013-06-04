require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Gritano::Core
  describe Permission do
    it "should have a contributor" do
      Permission.new(repository_id: 1, access: 1).should be_invalid
    end

    it "should have a repository" do
      Permission.new(contributor_id: 1, access: 1).should be_invalid
    end

    it "should have a access type" do
      Permission.new(contributor_id: 1, repository_id: 1).should be_invalid
    end
  end
end