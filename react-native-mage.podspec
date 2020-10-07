require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-mage"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  Automatically and simultaneously test and optimize in-app purchase prices in 170+ app store countries. You do not need to hire data scientists to take your pricing to the next level. Just use the Mage SDK. Sign up for free!
                   DESC
  s.homepage     = "https://github.com/getmageio/mage-react-native-sdk"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Mage Labs GmbH" => "team@getmage.io" }
  s.platforms    = { :ios => "11.0" }
  s.source       = { :git => "https://github.com/getmageio/mage-react-native-sdk.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  s.dependency "Mage", '~> 1.1.1'
  # ...
  # s.dependency "..."
end

