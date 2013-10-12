require 'pry'
module Poper
  class Runner
    def initialize(commit, repo_path = '.')
      @repo = Rugged::Repository.new(repo_path)
      @commit = @repo.lookup(commit)
    end

    def run
      commits.map { |c| c.message }
    end

    private

    def commits
      @commits ||= begin
        walker.reset
        walker.push(@repo.last_commit)
        walker.take_while { |c| c.oid != @commit.oid }
      end
    end

    def walker
      @walker ||= Rugged::Walker.new(@repo)
    end
  end
end
