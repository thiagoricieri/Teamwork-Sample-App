use_frameworks!

def shared_pods
    pod 'Alamofire'
    pod 'MBProgressHUD'
    pod 'SDWebImage', '~> 3.7.3'
    pod 'TagListView', '~> 1.0'
end

target 'TeamworkSample' do
    shared_pods
    
    target 'TeamworkSampleTests' do
        inherit! :search_paths
    end
    
    target 'TeamworkSampleUITests' do
        inherit! :search_paths
    end
end
