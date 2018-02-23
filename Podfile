# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'AMPNews' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks

def shared_pods
#Alamofire
pod 'Alamofire', '~> 4.6'

#SwiftyJSON
pod 'SwiftyJSON', '~> 4.0'
end

  use_frameworks!

  # Pods for AMPNews
  shared_pods

  target 'AMPNewsTests' do
    inherit! :search_paths
    # Pods for testing
    shared_pods
  end

  target 'AMPNewsUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
