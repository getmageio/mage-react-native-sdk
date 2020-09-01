require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-mage"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  getmage.io provides smart pricing for your in-app purchases. Distributing products globally should not be a one price fits all strategy. Get started with Mage to scale your products worldwide!
                   DESC
  s.homepage     = "https://github.com/getmageio/mage-react-native-sdk"
  # brief license entry:
  s.license      = "MIT"
  # optional - use expanded license entry instead:
  # s.license    = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Patrick Blaesing" => "patrick@getmage.io" }
  s.platforms    = { :ios => "11.0" }
  s.source       = { :git => "https://github.com/getmageio/mage-react-native-sdk.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  s.dependency "Mage", '~> 1.0'
  # ...
  # s.dependency "..."
end

