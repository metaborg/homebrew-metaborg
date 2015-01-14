require "formula"

class Strategoxt < Formula
  homepage "http://metaborg.org/stratego/"
  version "20150113"
  revision 2
  url "https://github.com/metaborg/strategoxt/releases/download/baselines/baseline-#{version}/strategoxt-distrib.tar"
  sha1 "dbf298d678398897413c7ef36d63b54d53a87b6b"

  def install
    share.install Dir["share/*"]
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

    #bin.install Dir["share/macosx/*"]
  end

  test do
    system bin+"strj"
  end

end
