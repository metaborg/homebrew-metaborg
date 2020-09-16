cask 'spoofax' do
  version '2.5.11'
  sha256 '22606482d1c24738ec79b0ae83b820ed81f3222a6c3bc18c6bb66015ca92401d'

  url "https://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/org.metaborg.spoofax.eclipse.dist/#{version}/org.metaborg.spoofax.eclipse.dist-#{version}-macosx-x64-jre.tar.gz"
  appcast 'https://github.com/metaborg/spoofax/releases.atom'
  name 'Spoofax'
  homepage 'https://www.metaborg.org/'

  app 'spoofax.app'
end
