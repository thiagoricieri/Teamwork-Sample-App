use_frameworks!

def shared_pods
    pod 'Alamofire'
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