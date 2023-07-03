require 'spec_helper'
require 'ronin/listener/cli/commands/new'
require_relative 'man_page_example'

describe Ronin::Listener::CLI::Commands::New do
  include_examples "man_page"
end
