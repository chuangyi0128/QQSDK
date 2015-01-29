#
# Be sure to run `pod lib lint QQSDK.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "QQSDK"
  s.version          = "2.3.1"
  s.summary          = "QQ SDK v2.3.1"
  s.description      = "QQ SDK v2.3.1 arm64"
  s.homepage         = "https://github.com/chuangyi0128/QQSDK"
  s.license          = 'MIT'
  s.author           = { "SongLi" => "chuangyi0128@gmail.com" }
  s.source           = { :git => "https://github.com/chuangyi0128/QQSDK.git", :tag => s.version.to_s }

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = 'QQSDK/TencentOpenAPI.framework/Headers'
  s.resource = 'QQSDK/TencentOpenApi_IOS_Bundle.bundle'
  s.vendored_frameworks = 'QQSDK/TencentOpenAPI.framework'
  s.libraries = 'stdc++','z','sqlite3','iconv'
  s.frameworks = 'Security', 'SystemConfiguration','CoreGraphics','CoreTelephony'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-fobjc-arc' }

end
