require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Gritano::Core
  describe User do

    before(:each) do
      Grit::Repo.stub(:init_bare)
    end

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
      user.keys.create(name: 'my_first_key', key: File.open('spec/key.pub').readlines.join)
      user.keys.create(name: 'my_second_key', key: File.open('spec/key.pub').readlines.join)
      user.keys.count.should be == 2
    end

    it "can contribute to repositories" do
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')

      contributor = User.create(login: 'jessicaeto')
      repo.permissions.create(contributor_id: contributor.id, access: 0)

      contributor.repositories.count.should be == 1
    end

    it "can receive READ access to a reporitory" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
      user.add_access(repo, :read)
      user.check_access(repo, :read).should be_true
      user.check_access(repo, :write).should be_false
    end

    it "can receive WRITE access to a reporitory" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
      user.add_access(repo, :write)
      user.check_access(repo, :read).should be_false
      user.check_access(repo, :write).should be_true
    end

    it "can receive READ and WRITE access to a reporitory" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
      user.add_access(repo, :write)
      user.add_access(repo, :read)
      user.check_access(repo, :read).should be_true
      user.check_access(repo, :write).should be_true
    end

    it "can not receive UNKNOWN access to a reporitory" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
      user.add_access(repo, :wrong_type).should be_false
    end

    it "should not allow user without permissions" do
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
      contributor = User.create(login: 'jessicaeto')
      contributor.check_access(repo, :write).should be_false
      contributor.check_access(repo, :read).should be_false
    end

    it "can loose READ access from a READ repository" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')

      user.add_access(repo, :read)
      user.remove_access(repo, :read)

      user.check_access(repo, :read).should be_false
      user.check_access(repo, :write).should be_false
    end

    it "can loose READ access from a WRITE repository" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')

      user.add_access(repo, :write)
      user.remove_access(repo, :read)

      user.check_access(repo, :read).should be_false
      user.check_access(repo, :write).should be_true
    end

    it "can loose READ access from a READ/WRITE repository" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')

      user.add_access(repo, :read)
      user.add_access(repo, :write)
      user.remove_access(repo, :read)

      user.check_access(repo, :read).should be_false
      user.check_access(repo, :write).should be_true
    end

    it "can loose WRITE access from a READ repository" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')

      user.add_access(repo, :read)
      user.remove_access(repo, :write)

      user.check_access(repo, :read).should be_true
      user.check_access(repo, :write).should be_false
    end

    it "can loose WRITE access from a WRITE repository" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')

      user.add_access(repo, :write)
      user.remove_access(repo, :write)

      user.check_access(repo, :read).should be_false
      user.check_access(repo, :write).should be_false
    end

    it "can loose WRITE access from a READ/WRITE repository" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')

      user.add_access(repo, :read)
      user.add_access(repo, :write)
      user.remove_access(repo, :write)

      user.check_access(repo, :read).should be_true
      user.check_access(repo, :write).should be_false
    end

    it "can not loose UNKNOWN access from a reporitory" do
      user = User.create(login: 'igorbonadio')
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
      user.remove_access(repo, :wrong_type).should be_false
    end
  end
end