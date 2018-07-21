#
# Be sure to run `pod lib lint SmallAutoLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SmallAutoLayout'
  s.version          = '3.0.0'
  s.summary          = 'Description of SmallAutoLayout.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
NSLayoutConstraint is very difficulty to use
Easy to use Auto
                       DESC

  s.homepage         = 'https://github.com/BetrayalPromise/SmallAutoLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BetrayalPromise' => 'BetrayalPromise@gmail.com' }
  s.source           = { :git => 'https://github.com/BetrayalPromise/SmallAutoLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SmallAutoLayout/SmallAutoLayout.h'
  s.public_header_files = 'SmallAutoLayout/SmallAutoLayout.h'


  s.subspec 'Layout' do |ss|
    ss.source_files = 'SmallAutoLayout/Layout/*.{h,m}'
    ss.public_header_files = 'SmallAutoLayout/Layout/*.{h}'
  end

  s.subspec 'Convenience' do |ss|
    ss.source_files = 'SmallAutoLayout/Convenience/*.{h,m}'
    ss.public_header_files = 'SmallAutoLayout/Convenience/*.{h}'
  end
end
