# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
def shared_pods
#Alamofire
pod 'Alamofire', '~> 4.6'

#SwiftyJSON
pod 'SwiftyJSON', '~> 4.0'

#Kingfisher
pod 'Kingfisher', '~> 4.6.1'

#RxSwift
pod 'RxSwift', '~> 4.1.1'
pod 'RxCocoa', '~> 4.1.1'
end

target 'AMPNews' do
  use_frameworks!

  # Pods for AMPNews
  shared_pods

  target 'AMPNewsTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '~> 4.1.1'
    pod 'RxTest',     '~> 4.1.1'
  end

  target 'AMPNewsUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
