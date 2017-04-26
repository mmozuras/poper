module Poper
  class ConfigFile
    EMPTY = {
      'disallow_single_word' => {
        'enabled' => true
      },
      'character_limit' => {
        'enabled' => true,
        'number' => 72
      },
      'summary_character_limit' => {
        'enabled' => true,
        'number' => 50
      },
      'disallow_generic' => {
        'enabled' => true,
        'words' => %w[fix fixed fixes oops todo fixme commit changes hm hmm hmmm
                      test tests quickfix]
      },
      'enforce_capitalized' => {
        'enabled' => true
      },
    }.freeze

    def initialize(path = '.poper.yml')
      @path = path
    end

    def to_h
      hash = File.exist?(@path) ? YAML.load_file(@path) : {}
      deep_merge(hash)
    end

    private

    def deep_merge(hash)
      merger = proc do |_, oldval, newval|
        if oldval.is_a?(Hash) && newval.is_a?(Hash)
          oldval.merge(newval, &merger)
        else
          oldval.nil? ? newval : oldval
        end
      end

      hash.merge(EMPTY, &merger)
    end
  end
end
