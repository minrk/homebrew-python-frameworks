cask 'python-framework-37' do
  version '3.7.7'
  sha256 'b0076ab5083aa596ddae74f9ae2b48fde80c6f6414766b5db5510d9147068efb'
  url "https://www.python.org/ftp/python/#{version}/python-#{version}-macosx10.9.pkg"
  name 'Python'
  homepage 'https://www.python.org/'

  pkg "python-#{version}-macosx10.9.pkg"

  postflight do
    system_command "/Applications/Python #{version.slice(%r{\d+\.\d+})}/Install Certificates.command"
  end

  uninstall pkgutil: [
                       "org.python.Python.PythonApplications-#{version.slice(%r{\d+\.\d+})}",
                       "org.python.Python.PythonDocumentation-#{version.slice(%r{\d+\.\d+})}",
                       "org.python.Python.PythonFramework-#{version.slice(%r{\d+\.\d+})}",
                       "org.python.Python.PythonUnixTools-#{version.slice(%r{\d+\.\d+})}",
                     ],
            delete:  [
                       "/Library/Receipts/PythonInstallPip-#{version.slice(%r{\d+\.\d+})}",
                       "/Applications/Python #{version.slice(%r{\d+\.\d+})}",
                       "/Library/Frameworks/Python.Framework/Versions/#{version.slice(%r{\d+\.\d+})}",
                       "/Library/Python/#{version.slice(%r{\d+\.\d+})}",
                     ]

  zap delete: "~/Library/Python/#{version.slice(%r{\d+\.\d+})}"
end
