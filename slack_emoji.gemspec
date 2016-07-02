lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack_emoji/version'

Gem::Specification.new do |spec|
  spec.name          = "slack_emoji"
  spec.version       = SlackEmoji::VERSION
  spec.authors       = ["dnond"]
  spec.email         = ["tarosuk@gmail.com"]

  spec.summary       = 'list up slack emoji'
  spec.description   = 'list up slack emoji'
  spec.homepage      = "https://github.com/dnond/slack_emoji"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['slack_emoji']
  spec.require_paths = ["lib"]

  spec.add_dependency "slack-api"
  spec.add_dependency 'diskcached'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
