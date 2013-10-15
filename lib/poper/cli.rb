require 'thor'

module Poper
  class CLI < Thor
    require 'poper'
    require 'poper/version'

    desc 'exec COMMIT', 'Run Poper'

    def exec(commit)
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
