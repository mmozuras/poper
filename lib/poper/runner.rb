module Poper
  class Runner
    def initialize(commit, repo_path = '.')
      @repo = Rugged::Repository.new(repo_path)
      @commit = @repo.lookup(commit)
    end

    def run
      commits.map { |c| check(c) }
             .flatten
             .compact
    end

    private

    def check(commit)
      rules.map { |rule| rule.check(commit.message) }
    end

    def rules
      Rule::Rule.all.map { |rule| rule.new }
    end

    def commits
      @commits ||= begin
        walker.reset
        walker.push(@repo.last_commit)
        walker.take_while { |c| c.oid != @commit.oid } << @commit
      end
    end

    def walker
      @walker ||= Rugged::Walker.new(@repo)
    end
  end
end
