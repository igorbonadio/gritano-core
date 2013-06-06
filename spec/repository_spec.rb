require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Gritano::Core
  describe Repository do
    
    before(:each) do
      Grit::Repo.stub(:init_bare)
    end

    it "should be invalid without a name" do
      Repository.new(path: 'path/to/some/folder').should be_invalid
    end

    it "should be invalid without a path" do
      Repository.new(name: 'my_repo.git').should be_invalid
    end

    it "should have a unique name" do
      Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
      Repository.new(name: 'my_repo.git', path: 'path/to/some/folder').should be_invalid
    end

    it "should have a name that ends with '.git'" do
      Repository.new(name: 'my_repo', path: 'path/to/some/folder').should be_invalid
    end

    it "can have contributors" do
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')

      contributor1 = User.create(login: 'jessicaeto')
      contributor2 = User.create(login: 'arybonadio')
      repo.permissions.create(contributor_id: contributor1.id, access: 0)
      repo.permissions.create(contributor_id: contributor2.id, access: 0)
      repo.contributors.count.should be == 2
    end

    it "should return its full path" do
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
      repo.full_path.should be == "path/to/some/folder/my_repo.git"
    end

    it "should create a bare repo when it is created" do
      Grit::Repo.should_receive(:init_bare).with('path/to/some/folder/my_repo.git')
      Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
    end

    it "should remove the bare repo when it is destroyed" do
      repo = Repository.create(name: 'my_repo.git', path: 'path/to/some/folder')
      FileUtils.should_receive(:rm_r).with('path/to/some/folder/my_repo.git', force: true)
      repo.destroy.should be_true
    end

  end
end