# ruby_gpt.gemspec
Gem::Specification.new do |spec|
  spec.name          = 'ruby_gpt'
  spec.version       = '0.1.0'
  spec.summary       = 'A CLI for interacting with OpenAI GPT models.'
  spec.description   = 'A simple CLI tool powered by OpenAI GPT.'
  spec.authors       = ['Saahil Sabu Hameed']
  spec.email         = 'saahil.sabu@gmail.com'
  spec.files         = Dir.glob('{lib,bin}/**/*') + ['ruby_gpt.gemspec']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
