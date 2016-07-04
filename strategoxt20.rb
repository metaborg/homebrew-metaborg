require "formula"

class Strategoxt20 < Formula
  desc "Stratego/XT Commandline Tools (Unstable)"
  homepage "http://metaborg.org/stratego/"
  @@baseVersion = "2.0.0"
  version "#{@@baseVersion}-20160630.164302-224"
  url "http://artifacts.metaborg.org/service/local/repositories/snapshots/content/org/metaborg/strategoxt-distrib/#{@@baseVersion}-SNAPSHOT/strategoxt-distrib-#{version}-bin.tar"
  sha256 "7cab2631fa1524d2ecf1c4a276ef0b8669a5971c42967d410594158f4e7a1925"

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
