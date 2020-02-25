cask 'python-framework-27' do
  version '2.7.17'
  sha256 '69c5bddef6e2f20a47be63410f890b728281449ed64ea450f89d0e81babc83b4'

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
