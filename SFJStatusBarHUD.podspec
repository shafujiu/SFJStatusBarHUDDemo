
Pod::Spec.new do |spec|

  spec.name         = "SFJStatusBarHUD"
  spec.version      = "1.0.0"
  spec.summary      = "https://github.com/shafujiu/SFJStatusBarHUDDemo/blob/master/README.md"
  spec.homepage     = "https://github.com/shafujiu/SFJStatusBarHUDDemo"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.authors      = { "砂缚柩" => "zhaowei200711@163.com" }
  spec.platform     = :ios, "10.3"
  spec.source       = { :git => "https://github.com/shafujiu/SFJStatusBarHUDDemo.git", :tag => "v#{spec.version}" }
  spec.source_files = "SFJStatusBarHUD/**/*.{h,m}"
  spec.resources    = "SFJStatusBarHUD/*.bundle"

  spec.requires_arc = true

end
