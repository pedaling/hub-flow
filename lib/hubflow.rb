require "hubflow/version"

module Hubflow
  def self.pull_request(message)
    branch_name = `git rev-parse --abbrev-ref HEAD`.chomp

    if branch_name.start_with? 'hotfix'
      system "hub pull-request -m \"#{message}\" -b master"
    end

    system "hub pull-request -m \"#{message}\" -b develop"
  end
end
