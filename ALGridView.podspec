Pod::Spec.new do |s|

  s.name         = "ALGridView"
  s.version      = "0.0.2"
  s.summary      = "Simple Grid View control in swift"

  s.homepage     = "http://github.com/al7/ALGridView"
  s.license      = "MIT"
  s.author       = { "Alex Leite" => "admin@al7dev.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/al7/ALGridView.git", :tag => "0.0.2" }
  s.source_files = "ALGridView/Source", "ALGridView/Source/**/*.{h,m,swift}"
  s.requires_arc = true

end
