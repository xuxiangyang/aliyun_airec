require_relative 'lib/aliyun_airec/version'

Gem::Specification.new do |spec|
  spec.name          = "aliyun_airec"
  spec.version       = AliyunAirec::VERSION
  spec.authors       = ["xuxiangyang"]
  spec.email         = ["xxy@xuxiangyang.com"]

  spec.summary       = %q{阿里云 智能推荐 Aliyun AIRec}
  spec.description   = %q{阿里云 智能推荐 Aliyun AIRec}
  spec.homepage      = "https://github.com/xuxiangyang/aliyun_airec"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/xuxiangyang/aliyun_airec"
  spec.metadata["changelog_uri"] = "https://github.com/xuxiangyang/aliyun_airec/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency 'aliyunsdkcore', ">= 0.0.13"
end
