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

    it "can have many keys" do
      user = User.create(login: 'igorbonadio')
      user.keys.create(name: 'my_first_key', key: 'some key')
      user.keys.create(name: 'my_second_key', key: 'some key')
      user.keys.count.should be == 2
    end

    it "can own repositories" do
      user = User.create(login: 'igorbonadio')
      user.owned_repositories.create(name: 'my_first_repo', path: 'path/to/some/folder')
      user.owned_repositories.create(name: 'my_second_repo', path: 'path/to/some/folder')
      user.owned_repositories.count.should be == 2
    end

    it "can contribute to repositories" do
      user = User.create(login: 'igorbonadio')
      repo = user.owned_repositories.create(name: 'my_repo', path: 'path/to/some/folder')

      contributor = User.create(login: 'jessicaeto')
      repo.permissions.create(contributor_id: contributor.id, access: 0)

      contributor.repositories.count.should be == 1
    end

    it "can receive READ access to a reporitory" do
      user = User.create(login: 'igorbonadio')
      repo = user.owned_repositories.create(name: 'my_repo', path: 'path/to/some/folder')

      contributor = User.create(login: 'jessicaeto')
      user.add_access(repo, :read)
      user.check_access(repo, :read).should be_true
      user.check_access(repo, :write).should be_false
    end

    it "can receive WRITE access to a reporitory" do
      user = User.create(login: 'igorbonadio')
      repo = user.owned_repositories.create(name: 'my_repo', path: 'path/to/some/folder')

      contributor = User.create(login: 'jessicaeto')
      user.add_access(repo, :write)
      user.check_access(repo, :read).should be_false
      user.check_access(repo, :write).should be_true
    end

    it "can receive READ and WRITE access to a reporitory" do
      user = User.create(login: 'igorbonadio')
      repo = user.owned_repositories.create(name: 'my_repo', path: 'path/to/some/folder')

      contributor = User.create(login: 'jessicaeto')
      user.add_access(repo, :write)
      user.add_access(repo, :read)
      user.check_access(repo, :read).should be_true
      user.check_access(repo, :write).should be_true
    end

    it "can not receive UNKNOWN access to a reporitory" do
      user = User.create(login: 'igorbonadio')
      repo = user.owned_repositories.create(name: 'my_repo', path: 'path/to/some/folder')

      contributor = User.create(login: 'jessicaeto')
      user.add_access(repo, :wrong_type).should be_false
    end
  end
end