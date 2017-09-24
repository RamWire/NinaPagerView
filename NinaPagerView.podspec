Pod::Spec.new do |s|
s.name     = 'NinaPagerView'
s.version  = '1.6.2'
s.license  = 'MIT'
s.platform      = :ios, '7.0'
s.summary  = 'NinaPagerView is a low-coupling segment easy to page your controllers and views.'
s.homepage = 'https://github.com/RamWire/NinaPagerView'
s.author   = { 'RamWire' => 'RamWire' }
s.source   = { :git => 'https://github.com/RamWire/NinaPagerView.git', :tag => s.version.to_s }
s.source_files = 'NinaPagerView/**/*.{h,m}'
s.framework = 'UIKit'
s.requires_arc  = true
end
