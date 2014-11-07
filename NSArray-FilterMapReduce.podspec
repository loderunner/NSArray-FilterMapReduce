Pod::Spec.new do |s|
  s.name         = 'NSArray-FilterMapReduce'
  s.version      = '1.0'
  s.summary      = 'An extension for NSArray adding functional programming methods to NSArray using blocks.'
  s.homepage     = 'http://github.com/loderunner/NSArray-FilterMapReduce'
  s.license      = 'MIT'
  s.author       = { 'Charles Francoise' => 'charles.francoise@gmail.com' }
  s.source       = { :git => 'git@github.com:loderunner/NSArray-FilterMapReduce.git', :tag => '1.0' }
  s.source_files = 'NSArray+FilterMapReduce.h,m'
  s.platform     = :osx, '10.6'
  s.requires_arc = false
end
