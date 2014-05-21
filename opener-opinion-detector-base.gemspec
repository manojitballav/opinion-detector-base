require File.expand_path('../lib/opener/opinion_detectors/base/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'opener-opinion-detector-base'
  gem.version     = Opener::OpinionDetectors::Base::VERSION
  gem.authors     = ['development@olery.com']
  gem.summary     = 'Base Opinion Detector for english and dutch.'
  gem.description = gem.summary
  gem.homepage    = 'http://opener-project.github.com/'
  gem.extensions  = ['ext/hack/Rakefile']

  gem.required_ruby_version = '>= 1.9.2'

  gem.files = Dir.glob([
    'core/site-packages/pre_build/**/*',
    'core/packages/**/*',
    'core/python-scripts/**/*',
    'core/vendor/src/**/*',
    'core/*',
    'ext/**/*',
    'lib/**/*',
    '*.gemspec',
    '*_requirements.txt',
    'README.md'
  ]).select { |file| File.file?(file) }

  gem.executables = Dir.glob('bin/*').map { |file| File.basename(file) }

  gem.add_dependency 'opener-build-tools', ['>= 0.2.7']
  gem.add_dependency 'rake'
  gem.add_dependency 'nokogiri'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
end
