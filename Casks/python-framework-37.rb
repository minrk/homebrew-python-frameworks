cask 'python-framework-37' do
  version '3.7.6'
  sha256 '7dcbb0ff28f024e5dc4e8b909d1375d49cfbb72ecd96e2988b556b8374c24acd'
  url "https://www.python.org/ftp/python/#{version}/python-#{version}-macosx10.9.pkg"
  name 'Python'
  homepage 'https://www.python.org/'

  pkg "python-#{version}-macosx10.9.pkg"

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
