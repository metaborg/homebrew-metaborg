require "formula"

class Strategoxt20 < Formula
  desc "Stratego/XT Commandline Tools (Unstable)"
  homepage "http://metaborg.org/stratego/"
  @@baseVersion = "2.0.0"
  version "#{@@baseVersion}-20160520.101344-136"
  url "http://artifacts.metaborg.org/service/local/repositories/snapshots/content/org/metaborg/strategoxt-distrib/#{@@baseVersion}-SNAPSHOT/strategoxt-distrib-#{version}-bin.tar"
  sha256 "afc8672e8499e8896d0c1c9ee5f95aa6a402815ca1c26532dc58ddb7c5829faa"

  conflicts_with "strategoxt", :because => "Different Stratego/XT version already installed."

  def install
    # the ordering is sensitive here, if you get this wrong,
    # 'Warning: tried to install empty array to ...' will appear.
    install_bin_natives
    install_bin_scripts
    install_share
  end

  def install_bin_natives
    case RbConfig::CONFIG['host_os']
    when /darwin|mac os/
      bin.install Dir["share/strategoxt/macosx/*"]
    when /linux/
      bin.install Dir["share/strategoxt/linux/*"]
    else
      opoo "Skipped sdf2table and implodePT, not supported on this platform."
    end
  end

  def install_bin_scripts
    bin.install Dir["share/strategoxt/bin/*"]
  end

  def install_share
    share.install Dir["share/*"]
  end

  test do
    system bin/"strj"
  end

end
