require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Gritano::Core
  describe Permission do
    it "should have a contributor" do
      Permission.new(repository_id: 1, access: 1).should be_invalid
    end

    it "should have a repository" do
      Permission.new(user_id: 1, access: 1).should be_invalid
    end

    it "should have a access type" do
      Permission.new(user_id: 1, repository_id: 1).should be_invalid
    end

    it "should add READ access" do
      permission = Permission.new(user_id: 1, repository_id: 1)
      permission.add_access(:read)
      permission.access.should be == Permission::READ
    end

    it "should add WRITE access" do
      permission = Permission.new(user_id: 1, repository_id: 1)
      permission.add_access(:write)
      permission.access.should be == Permission::WRITE
    end

    it "should add WRITE access" do
      permission = Permission.new(user_id: 1, repository_id: 1)
      permission.add_access(:write)
      permission.add_access(:read)
      permission.access.should be == Permission::WRITE | Permission::READ
    end

    it "should remove READ access" do
      permission = Permission.new(user_id: 1, repository_id: 1, access: 3)
      permission.remove_access(:read)
      permission.access.should be == Permission::WRITE
    end

    it "should remove WRITE access" do
      permission = Permission.new(user_id: 1, repository_id: 1, access: 3)
      permission.remove_access(:write)
      permission.access.should be == Permission::READ
    end

    it "should remove WRITE access" do
      permission = Permission.new(user_id: 1, repository_id: 1, access: 3)
      permission.remove_access(:write)
      permission.remove_access(:read)
      permission.access.should be == 0
    end
  end
end