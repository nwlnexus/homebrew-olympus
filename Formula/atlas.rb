class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.30.0/atlas-darwin-aarch64.tar.gz"
      sha256 "5ced49e2cdfe2fda596d698d85acbd695b626a6a8cef542c48091fee61286808"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.30.0/atlas-darwin-x86_64.tar.gz"
      sha256 "134c988836b20cf57932bcddc4214b403ac3a187e6dc98d1d94232df95353671"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.30.0/atlas-linux-aarch64.tar.gz"
      sha256 "2afc0af25344c83d7d78f45085393d2b6e49211c2317d66d7ea5edcf72f0fa06"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.30.0/atlas-linux-x86_64.tar.gz"
      sha256 "e82a37076a708844cef768dd8901c8890d5df3c034f7d128ee4f25923842f21d"
    end
  end

  def install
    bin.install "atlas"
    (etc/"atlas").mkpath
    File.write("#{etc}/atlas/install-method", "brew")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atlas --version")
  end
end
