require "formula"

class StrategoxtAT23 < Formula
  desc "Stratego/XT Commandline Tools"
  homepage "http://metaborg.org/"
  license "Apache-2.0"
  version "2.3.0"
  url "http://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/strategoxt-distrib/#{version}/strategoxt-distrib-#{version}-bin.tar"
  sha256 "eda10a5565f32447c320ad0cf9500c74bdbb834fe57081a8e9fe3ff45226c397"
  revision 1

  keg_only :versioned_formula

  depends_on "openjdk"

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
