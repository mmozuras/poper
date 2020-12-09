require 'ostruct'

module Poper
  class Runner
    def initialize(commit, repo_path = '.')
      @repo = Rugged::Repository.new(repo_path)
      oid = @repo.rev_parse_oid(commit)
      @commit = @repo.lookup(oid)
    end

    def run
      commits.flat_map { |c| check(c) }.compact
    end

    private

    def check(commit)
      rules.map do |rule|
        result = rule.check(commit.message)
        OpenStruct.new(commit: commit.oid, message: result) if result
      end
    end

    def rules
      Rule::Rule.all.map do |rule_klass|
        rule = rule_klass.new

        rule if rule.enabled?
      end.compact
    end

    def commits
      @commits ||= begin
        walker.reset
        walker.push(@repo.last_commit.oid)
        walker.take_while { |c| c.oid != @commit.oid } << @commit
      end
    end

    def walker
      @walker ||= Rugged::Walker.new(@repo)
    end
  end
end
