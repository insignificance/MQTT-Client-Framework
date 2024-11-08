Pod::Spec.new do |mqttc|
	mqttc.name         = "MQTTClient"
	mqttc.version      = "0.15.4"
	mqttc.summary      = "iOS, macOS and tvOS native ObjectiveC MQTT Client Framework"
	mqttc.homepage     = "https://github.com/novastone-media/MQTT-Client-Framework"
	mqttc.license      = { :type => "EPLv1", :file => "LICENSE" }
	mqttc.author       = { "novastonemedia" => "ios@novastonemedia.com" }
	mqttc.source       = {
		:git => "https://github.com/insignificance/MQTT-Client-Framework.git",
		:tag => "0.15.4",
		:submodules => true
	}

	mqttc.requires_arc = true
	mqttc.platform = :ios, "12.0", :osx, "10.13"
	mqttc.ios.deployment_target = "12.0"
	mqttc.osx.deployment_target = "10.13"
	mqttc.default_subspec = 'Core'

	mqttc.subspec 'Core' do |core|
		core.dependency 'MQTTClient/Min'
		core.dependency 'MQTTClient/Manager'
                core.ios.deployment_target = '12.0' # Core 子模块要求更高的系统版本
	end
	mqttc.xcconfig = {
        'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
        }
	mqttc.subspec 'Min' do |min|
		min.source_files =	"MQTTClient/MQTTClient/MQTTCFSocketDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTCFSocketEncoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTCFSocketTransport.{h,m}",
					"MQTTClient/MQTTClient/MQTTCoreDataPersistence.{h,m}",
					"MQTTClient/MQTTClient/MQTTDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTInMemoryPersistence.{h,m}",
					"MQTTClient/MQTTClient/MQTTLog.{h,m}",
					"MQTTClient/MQTTClient/MQTTStrict.{h,m}",
					"MQTTClient/MQTTClient/MQTTClient.h",
					"MQTTClient/MQTTClient/MQTTMessage.{h,m}",
					"MQTTClient/MQTTClient/MQTTPersistence.h",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicy.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyEncoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyTransport.{h,m}",
					"MQTTClient/MQTTClient/MQTTProperties.{h,m}",
					"MQTTClient/MQTTClient/MQTTSession.{h,m}",
					"MQTTClient/MQTTClient/MQTTSessionLegacy.{h,m}",
					"MQTTClient/MQTTClient/MQTTSessionSynchron.{h,m}",
					"MQTTClient/MQTTClient/MQTTTransport.{h,m}",
					"MQTTClient/MQTTClient/GCDTimer.{h,m}"
		min.ios.deployment_target = '12.0' # Min 子模块要求 iOS 13.0 及以上
	end

	mqttc.subspec 'MinL' do |minl|
		minl.dependency 'CocoaLumberjack'

		minl.source_files =	"MQTTClient/MQTTClient/MQTTCFSocketDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTCFSocketEncoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTCFSocketTransport.{h,m}",
					"MQTTClient/MQTTClient/MQTTCoreDataPersistence.{h,m}",
					"MQTTClient/MQTTClient/MQTTDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTInMemoryPersistence.{h,m}",
					"MQTTClient/MQTTClient/MQTTLog.{h,m}",
					"MQTTClient/MQTTClient/MQTTStrict.{h,m}",
					"MQTTClient/MQTTClient/MQTTClient.h",
					"MQTTClient/MQTTClient/MQTTMessage.{h,m}",
					"MQTTClient/MQTTClient/MQTTPersistence.h",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicy.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyEncoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyTransport.{h,m}",
					"MQTTClient/MQTTClient/MQTTProperties.{h,m}",
					"MQTTClient/MQTTClient/MQTTSession.{h,m}",
					"MQTTClient/MQTTClient/MQTTSessionLegacy.{h,m}",
					"MQTTClient/MQTTClient/MQTTSessionSynchron.{h,m}",
					"MQTTClient/MQTTClient/MQTTTransport.{h,m}",
					"MQTTClient/MQTTClient/GCDTimer.{h,m}"
                minl.ios.deployment_target = '12.0' # MinL 子模块要求 iOS 13.0 及以上
		minl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'LUMBERJACK=1' }
	end

	mqttc.subspec 'Manager' do |manager|
		manager.source_files =	"MQTTClient/MQTTClient/MQTTSessionManager.{h,m}", 
					"MQTTClient/MQTTClient/ReconnectTimer.{h,m}",
					"MQTTClient/MQTTClient/ForegroundReconnection.{h,m}"
		manager.dependency 'MQTTClient/Min'
		manager.ios.deployment_target = '12.0' # Manager 子模块要求 iOS 13.0 及以上
		
	end

	mqttc.subspec 'ManagerL' do |managerl|
		managerl.source_files =	"MQTTClient/MQTTClient/MQTTSessionManager.{h,m}", 
					"MQTTClient/MQTTClient/ReconnectTimer.{h,m}", 
					"MQTTClient/MQTTClient/ForegroundReconnection.{h,m}"
		managerl.dependency 'MQTTClient/MinL'
		managerl.ios.deployment_target = '12.0' # ManagerL 子模块要求 iOS 13.0 及以上
		managerl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'LUMBERJACK=1' }
	end

	mqttc.subspec 'Websocket' do |ws|
		ws.source_files = "MQTTClient/MQTTClient/MQTTWebsocketTransport/*.{h,m}"
		ws.dependency 'SocketRocket'
		ws.dependency 'MQTTClient/Min'
		ws.requires_arc = true
		ws.libraries = "icucore"
		ws.ios.deployment_target = '12.0' # Websocket 子模块要求 iOS 13.0 及以上
	end

	mqttc.subspec 'WebsocketL' do |wsl|
		wsl.source_files = "MQTTClient/MQTTClient/MQTTWebsocketTransport/*.{h,m}"
		wsl.dependency 'SocketRocket'
		wsl.dependency 'MQTTClient/MinL'
		wsl.requires_arc = true
		wsl.libraries = "icucore"
		wsl.ios.deployment_target = '12.0' # WebsocketL 子模块要求 iOS 13.0 及以上
		wsl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'LUMBERJACK=1' }
	end
end
