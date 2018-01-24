cask 'python-framework-27' do
  version '2.7.14'
  sha256 'd0378ffcc63db4c115ae67856ec8c78d9851c75ca60941aad4b96e794b2744de'

  url "https://www.python.org/ftp/python/#{version}/python-#{version}-macosx10.6.pkg"
  name 'Python'
  homepage 'https://www.python.org/'

  pkg "python-#{version}-macosx10.6.pkg"

  uninstall delete: [
                      "/Library/Receipts/Python*-#{version.slice(%r{\d+\.\d+})}.pkg",
                      "/Applications/Python #{version.slice(%r{\d+\.\d+})}",
                      "/Library/Frameworks/Python.Framework/Versions/#{version.slice(%r{\d+\.\d+})}",
                      "/Library/Python/#{version.slice(%r{\d+\.\d+})}",
                    ]

  zap delete: "~/Library/Python/#{version.slice(%r{\d+\.\d+})}"
end
