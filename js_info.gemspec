# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'js_info/version'

Gem::Specification.new do |gem|
  gem.name          = "js_info"
  gem.version       = JsInfo::VERSION
  gem.authors       = ["Chuyi Huang"]
  gem.email         = ["chuyihuang@gmail.com"]
  gem.description   = %q{Make javascript alert, confirm and prompt as controller level methods}
  gem.summary       = %q{Instead of using flash as the alert to the users, you can replace it with js_info which is simplier and code free in the view layers}
  gem.homepage      = "https://github.com/chuyihuang/js_info"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  #require rails
  gem.add_dependency "actionpack", ">= 3.0.0"

end
