require "formula"

class StrategoxtAT14 < Formula
  homepage "http://metaborg.org/stratego/"
  version "1.4.2"
  url "http://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/strategoxt-distrib/#{version}/strategoxt-distrib-#{version}-bin.tar"
  sha256 "b61a31f0b643a4cded06ec552b53416bc761ff3bd0cdb23291716abe883a3fd6"
  revision 2

  keg_only :versioned_formula

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
    commands = {
      "pp-aterm" => "run org.strategoxt.stratego-aterm.io-pp-aterm",
      "explode-aterm" => "run org.strategoxt.stratego-aterm.io-explode-aterm",
      "implode-aterm" => "run org.strategoxt.stratego-aterm.io-implode-aterm",
      "map-aterm" => "run org.strategoxt.stratego-aterm.io-map-aterm",
      "gen-renamed-sdf-module" => "run org.strategoxt.tools.main-gen-renamed-sdf-module",
      "gen-sdf-mix" => "run org.strategoxt.tools.main-gen-sdf-mix",
      "pack-sdf" => "run org.strategoxt.tools.main-pack-sdf",
      "pp-sdf" => "run org.strategoxt.tools.io-pp-sdf",
      "parse-pp-table" => "-Xss8m run org.strategoxt.tools.main-parse-pp-table",
      "parse-stratego" => "-Xss8m run org.strategoxt.tools.parse-stratego-io",
      "pp-stratego" => "-Xss8m run org.strategoxt.strc.io-pp-stratego",
      "ppgen" => "run org.strategoxt.tools.main-ppgen",
      "rtg2sig" => "run org.strategoxt.tools.main-rtg2sig",
      "sdf2parenthesize" => "run org.strategoxt.tools.main-sdf2parenthesize",
      "sdf2rtg" => "run org.strategoxt.tools.main-sdf2rtg",
      "strj" => "-Xss8m -Xmx1024m org.strategoxt.strj.Main"
    }
    commands.each do |command,arguments|
      (bin+command).write <<-EOS.undent
        #!/bin/bash
        exec java -cp #{share}/strategoxt/strategoxt/strategoxt.jar #{arguments} $@
      EOS
    end
  end

  def install_share
    share.install Dir["share/*"]
  end

  test do
    system bin+"strj"
  end

end
