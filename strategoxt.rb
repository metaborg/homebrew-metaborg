require "formula"

class Strategoxt < Formula
  homepage "http://metaborg.org/stratego/"
  version "20140618"
  url "https://github.com/metaborg/strategoxt/releases/download/baselines/baseline-#{version}/strategoxt-distrib.tar"
  sha1 "46764cbee62d932fdb040125348ee06000bbf028"

  def install
    share.install Dir["share/*"]
    commands = {
      "gen-renamed-sdf-module" => "run org.strategoxt.tools.main-gen-renamed-sdf-module",
      "gen-sdf-mix" => "run org.strategoxt.tools.main-gen-sdf-mix",
      "pack-sdf" => "run org.strategoxt.tools.main-pack-sdf",
      "parse-pp-table" => "-Xss8m run org.strategoxt.tools.main-parse-pp-table",
      "parse-stratego" => "-Xss8m run org.strategoxt.tools.parse-stratego-io",
      "ppgen" => "run org.strategoxt.tools.main-ppgen",
      "rtg2sig" => "run org.strategoxt.tools.main-rtg2sig",
      "sdf2parenthesize" => "run org.strategoxt.tools.main-sdf2parenthesize",
      "sdf2rtg" => "run org.strategoxt.tools.main-sdf2rtg",
      "strj" => "-Xss8m -Xmx1024m run"
    }
    commands.each do |command,arguments|
      (bin+command).write <<-EOS.undent
        #!/bin/bash
        exec java -cp #{share}/strategoxt/strategoxt/strategoxt.jar #{arguments} $@
      EOS
    end
  end

  test do
    system bin+"strategoxt"
  end

end
