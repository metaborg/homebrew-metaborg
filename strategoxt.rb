require "formula"

class Strategoxt < Formula
  homepage "http://metaborg.org/stratego/"
  version "20140618"
  revision 4
  url "https://github.com/metaborg/strategoxt/releases/download/baselines/baseline-#{version}/strategoxt-distrib.tar"
  sha1 "46764cbee62d932fdb040125348ee06000bbf028"

  def install
    share.install Dir["share/*"]
    commands = {
      "io-pp-aterm" => "run org.strategoxt.stratego-aterm.io-pp-aterm",
      "io-explode-aterm" => "run org.strategoxt.stratego-aterm.io-explode-aterm",
      "io-implode-aterm" => "run org.strategoxt.stratego-aterm.io-implode-aterm",
      "io-map-aterm" => "run org.strategoxt.stratego-aterm.io-map-aterm",
      "gen-renamed-sdf-module" => "run org.strategoxt.tools.main-gen-renamed-sdf-module",
      "gen-sdf-mix" => "run org.strategoxt.tools.main-gen-sdf-mix",
      "pack-sdf" => "run org.strategoxt.tools.main-pack-sdf",
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
  end

  test do
    system bin+"strj"
  end

end
