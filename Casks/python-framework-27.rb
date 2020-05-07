cask 'python-framework-27' do
  version '2.7.18'
  sha256 'c570f38b05dd8b112ad21b418cdf51a9816d62f9f44746452739d421be24d50c'

  url "https://www.python.org/ftp/python/#{version}/python-#{version}-macosx10.6.pkg"
  name 'Python'
  homepage 'https://www.python.org/'

  pkg "python-#{version}-macosx10.6.pkg"

  postflight do
    system_command "/Applications/Python #{version.slice(%r{\d+\.\d+})}/Install Certificates.command"
  end

  uninstall delete: [
                      "/Library/Receipts/Python*-#{version.slice(%r{\d+\.\d+})}.pkg",
                      "/Applications/Python #{version.slice(%r{\d+\.\d+})}",
                      "/Library/Frameworks/Python.Framework/Versions/#{version.slice(%r{\d+\.\d+})}",
                      "/Library/Python/#{version.slice(%r{\d+\.\d+})}",
                    ]

  zap delete: "~/Library/Python/#{version.slice(%r{\d+\.\d+})}"
end
