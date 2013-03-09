Gem::Specification.new do |gem|
  gem.name = 'bisect'
  gem.version = '0.1'

  gem.summary = 'Library for maintaining sorted arrays'
  gem.description = "A direct port of python's 'bisect' standard library to ruby."

  gem.authors = ['Conrad Irwin']
  gem.email = %w(conrad.irwin@gmail.com)
  gem.homepage = 'http://github.com/ConradIrwin/bisect'

  gem.license = 'MIT'

  gem.required_ruby_version = '>= 1.8.7'

  gem.add_development_dependency 'rspec'

  gem.files = `git ls-files`.split("\n")
end
