# frozen_string_literal: true

lib = File.expand_path('lib', '..')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'consul_watcher'
  spec.version       = IO.read('VERSION').chomp
  spec.authors       = ['Ryan Fortman']
  spec.email         = ['r.fortman.dev@gmail.com']

  spec.summary       = 'Send consul watch events to an amqp.'
  spec.homepage      = 'https://github.com/fortman/consul_watcher'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'bundler', '~> 2.0'
  spec.add_dependency 'bunny', '~> 1.7.0'
  spec.add_dependency 'hashdiff', '~> 0.3'
  spec.add_dependency 'slop', '~> 4.6'
end