Encoding.default_external = Encoding::UTF_8 if RUBY_VERSION >= "3.4"

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("Gemfile", Dir.pwd)

require "bundler/setup"
# bootsnap disabled due to encoding issues on Windows with Cyrillic paths
