Pod::Spec.new do |s|
  s.name         = 'RBSwiftLog'
  s.version      = '0.1.0'
  s.summary      = 'Swift elegant printing Log'
  s.description  = 'Swift prints error, warning, info and other logs'
  s.homepage     = 'https://github.com/yourname/MyLibrary'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Bo' => '807569007@qq.com' }
  s.source       = { :git => 'https://github.com/Rishon1/RBSwiftLog.git', :tag => s.version.to_s }
  s.source_files = 'RBSwiftLog/*.{swift,h,m}'
  s.platform     = :ios, '11.0'
  s.swift_version = '5.0'
end
