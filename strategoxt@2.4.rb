require "formula"

class StrategoxtAT24 < Formula
  desc "Stratego/XT Commandline Tools"
  homepage "http://metaborg.org/"
  version "2.4.1"
  url "http://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/strategoxt-distrib/#{version}/strategoxt-distrib-#{version}-bin.tar"
  sha256 "18bdf60947dbe3d460a2fa4c35b8892b343270fb5221449489d72f101fe17200"

  depends_on :java

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
