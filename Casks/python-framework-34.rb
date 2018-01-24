cask 'python-framework-34' do
  version '3.4.4'
  sha256 'a7ed0d70989db872a229a988bd7376a54858f43abbf70fa95cbecfebe8cb5544'

  url "https://www.python.org/ftp/python/#{version}/python-#{version}-macosx10.6.pkg"
  name 'Python'
  homepage 'https://www.python.org/'

  pkg "python-#{version}-macosx10.6.pkg"

  uninstall :pkgutil => [
                        "org.python.Python.PythonApplications-#{version.slice(/\d+\.\d+/)}",
                        "org.python.Python.PythonDocumentation-#{version.slice(/\d+\.\d+/)}",
                        "org.python.Python.PythonFramework-#{version.slice(/\d+\.\d+/)}",
                        "org.python.Python.PythonUnixTools-#{version.slice(/\d+\.\d+/)}",
                        ],
            :delete => [
                       "/Library/Receipts/PythonInstallPip-#{version.slice(/\d+\.\d+/)}",
                       "/Applications/Python #{version.slice(/\d+\.\d+/)}",
                       "/Library/Frameworks/Python.Framework/Versions/#{version.slice(/\d+\.\d+/)}",
                       "/Library/Python/#{version.slice(/\d+\.\d+/)}",
                       ]
  zap :delete => "~/Library/Python/#{version.slice(/\d+\.\d+/)}"
end
