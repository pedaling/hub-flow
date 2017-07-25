require "hub_flow/version"

module HubFlow
  def self.pull_request(message)
    branch_name = `git rev-parse --abbrev-ref HEAD`.chomp

    system "hub pull-request -m \"#{message}\" -b develop"

    if branch_name.start_with? 'hotfix'
      system "hub pull-request -m \"#{'[DEPLOY] ' + message}\" -b master"
    end
  end
end
