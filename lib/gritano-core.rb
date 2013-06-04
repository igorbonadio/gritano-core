ROOT_PATH = File.expand_path(File.dirname(__FILE__))

require 'active_record'
require 'grit'

require File.join(ROOT_PATH, 'gritano-core/user')
require File.join(ROOT_PATH, 'gritano-core/repository')
require File.join(ROOT_PATH, 'gritano-core/permission')
require File.join(ROOT_PATH, 'gritano-core/key')