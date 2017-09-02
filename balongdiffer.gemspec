Gem::Specification.new do |s|
  s.name        = 'balongdiffer'
  s.version     = '0.12.1'
  s.executables = %w[balongdiffer balongupdate]
  s.date        = '2017-08-05'
  s.summary     = "Prints diffs between two balong nv.bin files"
  s.description = "Prints the names of address fields that differ between two balong nv.bin files."
  s.authors     = ["Peter Ossian"]
  s.email       = 'msuossianpe@gmail.com'
  s.files       = ["lib/balongdiffer.rb",
                   "lib/balongdiffer/cli.rb",
                   "lib/balongdiffer/update.rb",
                   "lib/balongdiffer/version.rb",
                   "lib/balongdiffer/actions/compare/base.rb",
                   "lib/balongdiffer/actions/read/base.rb",
                   "lib/balongdiffer/actions/write/base.rb",
                   "lib/balongdiffer/data/base.rb",
                   "lib/balongdiffer/data/file.rb",
                   "ext/balong-nvtool"]
  s.homepage    =
    'http://rubygems.org/gems/balongdiffer'
end
