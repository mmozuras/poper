module Poper
  class Config
    def initialize(config_hash = ConfigFile.new.to_h)
      @config_hash = config_hash
    end

    %w[
      disallow_single_word
      character_limit
      summary_character_limit
      disallow_generic
      enforce_capitalized
    ].each do |rule|
      ConfigFile::EMPTY[rule].each do |key, _|
        name = "#{rule}_#{key}"
        define_method(name) { ENV["POPER_#{name.upcase}"] || @config_hash[rule][key] }
      end
    end
  end
end
