Pod::Spec.new do |s|
  s.name         = "ASPLayoutView"
  s.version      = "1.0"
  s.summary      = "Simplifies the use of autolayout"

  s.description  = <<-DESC
                   ASPLayoutView is a view with an ability to add new
                   subviews vertically or horizontally with an offset. Also it
                   simplifies the way you would show and hide your views.
                   DESC

  s.homepage     = "https://github.com/aspcartman/ASPLayoutView"

  s.license      = 'MIT'

  s.author       = { "Ruslan Fedorov" => "ruslan.fedorov@icloud.com" }

  s.platform     = :ios, '8.0'

  s.source       = { :git => "https://github.com/aspcartman/ASPLayoutView.git", :tag => "1.0" }

  s.source_files  = 'ASPLayoutView.{h,m}'

  s.public_header_files = 'ASPLayoutView.h'

  s.frameworks = 'UIKit'

  s.requires_arc = true

  s.dependency 'KeepLayout', :git => "https://github.com/iMartinKiss/KeepLayout.git"

end