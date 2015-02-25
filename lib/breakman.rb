require "breakman/version"

breaks_dir = File.expand_path "../breakman/breaks", __FILE__
Dir["#{breaks_dir}/*.rb"].each { |b| require b }

class Breakman
  class BadIdea < StandardError; end

  def self.break! dir
    breaker = new dir
    breaker.easy_mode!
    breaker.run!
  end

  def initialize dir
    unless system "git rev-parse --git-dir >/dev/null 2>&1"
      raise BadIdea, "'#{dir}' is not a git repo. Don't break things not under revision control."
    end
    unless system "git diff --quiet && git diff --cached --quiet"
      raise BadIdea, "'#{dir}' has uncommitted changes. Commit or stash them before breaking them."
    end

    @dir = dir
    @registry = []
  end

  def register breaker
    @registry << breaker
  end

  def run!
    @registry.each &:run!
  end

  def random_models count=nil
    models = Dir[File.join @dir, "app", "models", "**", "*.rb"]
    count ? models.sample(count) : models.shuffle
  end

  def easy_mode!
    register PluralizeFilename.new random_models.first
  end
end

require "breakman/railtie" if defined? Rails::Railtie
