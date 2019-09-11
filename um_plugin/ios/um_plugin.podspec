#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'um_plugin'
  s.version          = '1.0.4'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project for umeng.
                       DESC
  s.homepage         = 'https://github.com/Xingefb/um_plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'loself' => 'loselfmin@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'UMCCommon', '~> 2.1.1'
  s.dependency 'UMCAnalytics', '~> 6.0.5'
  
  s.ios.deployment_target = '9.0'
end

