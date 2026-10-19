class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.28.0/atlas-darwin-aarch64.tar.gz"
      sha256 "399e7214b0149292b96676ae7c083c125d70051ac32ba28ad0b837d265f401b3"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.28.0/atlas-darwin-x86_64.tar.gz"
      sha256 "75104a4ef97717bcfbbb2a288a7b22786c7e4812db5d8aa2e4805b227a6a0940"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.28.0/atlas-linux-aarch64.tar.gz"
      sha256 "b08702c4dc9f4fe1e019e6d9fc30181cf6b8789481ce72ab6ae07bdb933cd5af"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.28.0/atlas-linux-x86_64.tar.gz"
      sha256 "0399dd2272773d082179da728d3ccbf8134d3b759d4533e35030f61b3df550c5"
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
