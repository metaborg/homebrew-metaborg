cask "spoofax" do
  version "2.5.16"
  sha256 "8dea2332e0ed5314f3d37ca96a0b1ab5c8f5b172cd8cc0bac77abd825f9e5697"

  url "https://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/org.metaborg.spoofax.eclipse.dist/#{version}/org.metaborg.spoofax.eclipse.dist-#{version}-macosx-x64-jre.tar.gz"
  appcast "https://github.com/metaborg/spoofax/releases.atom"
  name "Spoofax"
  homepage "https://www.metaborg.org/"

  app "spoofax.app"
end
