require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Gritano::Core
  describe Repository do
    it "should be invalid without a name" do
      Repository.new(path: 'path/to/some/folder', owner_id: 1).should be_invalid
    end

    it "should be invalid without a path" do
      Repository.new(name: 'my_repo', owner_id: 1).should be_invalid
    end

    it "should be invalid without a owner" do
      Repository.new(name: 'my_repo', path: 'path/to/some/folder').should be_invalid
    end

    it "should have a unique name" do
      Repository.create(name: 'my_repo', path: 'path/to/some/folder', owner_id: 1)
      Repository.new(name: 'my_repo', path: 'path/to/some/folder', owner_id: 1).should be_invalid
    end

    it "should have a owner" do
      user = User.create(login: 'igorbonadio')
      repo = user.owned_repositories.create(name: 'my_repo', path: 'path/to/some/folder')
      repo.owner.login.should be == 'igorbonadio'
    end

  end
end