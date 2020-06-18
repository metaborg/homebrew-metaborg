cask 'spoofax-nightly' do
  version '2.6.0-SNAPSHOT'

  url 'http://buildfarm.metaborg.org/job/metaborg/job/spoofax-releng/job/master/lastSuccessfulBuild/artifact/dist/spoofax/eclipse/spoofax-macosx-x64-jre.tar.gz'
  name 'Spoofax'
  homepage 'https://www.metaborg.org/'

  app 'spoofax.app'
end
