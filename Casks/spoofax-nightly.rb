cask 'spoofax-nightly' do
  version :latest
  sha256 :no_check

  url 'http://buildfarm.metaborg.org/job/metaborg/job/spoofax-releng/job/master/lastSuccessfulBuild/artifact/dist/spoofax/eclipse/spoofax-macosx-x64-jre.tar.gz'
  name 'Spoofax'
  homepage 'https://www.metaborg.org/'

  app 'spoofax.app', target: 'spoofax-nightly.app'
end
