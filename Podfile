# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'Iddog' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Iddog
pod 'Alamofire'
pod 'SDWebImage', '~> 5.0'
pod 'RNLoadingButton-Swift'
pod 'Lightbox'

  target 'IddogTests' do
    inherit! :search_paths
     # Pods for testing
       pod 'Quick', '1.3.4'
       pod 'Nimble', '8.0.0'
  end

end

pre_install do |installer|
  installer.analysis_result.specifications.each do |s|
    s.swift_version = '4.2' unless s.swift_version
  end
end
