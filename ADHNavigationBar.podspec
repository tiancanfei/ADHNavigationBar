Pod::Spec.new do |s|

	s.name         = "ADHNavigationBar"
	s.version      = "0.0.1"
	s.summary      = "自定义导航栏"
	s.description  = <<-DESC
	                 自定义导航栏，可以精准控制状态栏的颜色，方便实用
	                 DESC
	s.homepage     = "https://github.com/tiancanfei/ADHNavigationBar"
	# 私有库可以不添加下面两项
	s.license      = { :type => "MIT", :file => "LICENSE" }
	s.author             = { "安德航" => "bjwltiankong@163.com" }
	#支持平台
	s.platform     = :ios
	#支持平台版本
	s.platform     = :ios, "10.0"
	#仓库地址 (不要使用ssh)
	s.source       = { :git => "https://github.com/tiancanfei/ADHNavigationBar.git", :tag => "#{s.version}" }
	#源文件位置 
	s.source_files = 'ADHNavigationBar/ADHNavigationBar/*.{h,m}'
	s.public_header_files = 'ADHNavigationBar/ADHNavigationBar/*.h'
	s.resources = ['ADHNavigationBar/ADHNavigationBar/ADHNavigationBar.bundle']

	s.pod_target_xcconfig = { 'VALID_ARCHS[sdk=iphonesimulator*]' => '' }

	s.requires_arc = true

end
