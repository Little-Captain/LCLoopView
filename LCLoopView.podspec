#
# Be sure to run `pod lib lint LCLoopView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LCLoopView'
  s.version          = '1.0.0'
  s.summary          = 'LCLoopView 是一个好用的轮播图控件.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
LCLoopView真的很好用, 不信你就试一试.
                       DESC

  s.homepage         = 'https://github.com/Little-Captain/LCLoopView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Little-Captain' => 'littlecaptain@foxmail.com' }
  s.source           = { :git => 'git@github.com:Little-Captain/LCLoopView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LCLoopView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LCLoopView' => ['LCLoopView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
