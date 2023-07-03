require 'spec_helper'
require 'ronin/listener/cli/commands/new/http'
require_relative '../man_page_example'

describe Ronin::Listener::CLI::Commands::New::Http do
  include_examples "man_page"
end
