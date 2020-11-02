cask "spoofax" do
  version "2.5.12"
  sha256 "f8899ffdfac8d4b948a834f711a7a0dd0feecfb0b3c03f845cb4c5099816a54c"

  url "https://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/org.metaborg.spoofax.eclipse.dist/#{version}/org.metaborg.spoofax.eclipse.dist-#{version}-macosx-x64-jre.tar.gz"
  appcast "https://github.com/metaborg/spoofax/releases.atom"
  name "Spoofax"
  homepage "https://www.metaborg.org/"

  app "spoofax.app"
end
