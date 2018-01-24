cask 'python-framework-35' do
  version '3.5.4'
  sha256 '6209c690925c0826fa767b7c9581b8ebe556160e1eac7a0dbd13500870a097a2'

  url "https://www.python.org/ftp/python/#{version}/python-#{version}-macosx10.6.pkg"
  name 'Python'
  homepage 'https://www.python.org/'

  pkg "python-#{version}-macosx10.6.pkg"

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
