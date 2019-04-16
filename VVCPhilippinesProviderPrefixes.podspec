Pod::Spec.new do |spec|
  spec.name = "VVCPhilippinesProviderPrefixes"
  spec.version = "0.1.0"
  spec.summary = "Philippines Telcos prefixes."
  spec.homepage = "https://github.com/viennarzc/VVCPhilippinesProviderPrefixes"
  spec.authors = { "Viennarz Curtiz" => 'viennarzc@gmail.com' }
  spec.social_media_url = "http://twitter.com/thoughtbot"

  spec.platform = :ios, "9.1"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/viennarzc/VVCPhilippinesProviderPrefixes.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "VVCPhilippinesProviderPrefixes/**/*.{h,swift}"

  spec.dependency "Curry", "~> 1.4.0"
end