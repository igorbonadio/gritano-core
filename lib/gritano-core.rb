root_path = File.expand_path(File.dirname(__FILE__))

require 'active_record'
require 'grit'

require File.join(root_path, 'gritano-core/user')
require File.join(root_path, 'gritano-core/repository')
require File.join(root_path, 'gritano-core/permission')
require File.join(root_path, 'gritano-core/key')
require File.join(root_path, 'gritano-core/migration')