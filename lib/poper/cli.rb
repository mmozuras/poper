require 'thor'

module Poper
  class CLI < Thor
    require 'poper'
    require 'poper/version'

    class << self
      def is_thor_reserved_word?(word, type)
        return false if word == 'run'
        super
      end
    end

    desc 'run COMMIT', 'Run Poper, checking commits from HEAD to it'

    def run(commit)
      Runner.new(commit).run.each do |message|
        puts "#{message.commit[0..6]}: #{message.message}"
      end
    end

    desc 'version', 'Show the Poper version'
    map %w(-v --version) => :version

    def version
      puts "Poper version #{::Poper::VERSION}"
    end
  end
end
